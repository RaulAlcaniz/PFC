class Exhibition < ActiveRecord::Base
  validates :name, presence: true
  validate :end_after_start
  validate :end_start_before_today
  validates :start_date, :end_date, :presence => true

  serialize :tax, JSON

  has_many :enrolments
  has_many :dogs, :through => :enrolments

  def payment_time_started?
    return false if tax.nil?
    Date.parse(JSON.parse(tax)['deadlines'].first['start_date']) <= Date.today
  end

  def payment_time_ended?
    return true if tax.nil?
    Date.parse(JSON.parse(tax)['deadlines'].last['end_date']) < Date.today
  end

  def exhibition_prices(day, dog_class, type_of_partner)
    group = what_group_has "#{dog_class}"
    return 'ERROR: There is no entries for this dog class' if group == nil
    entry = -1
    JSON.parse(tax)['deadlines'].each_with_index do |date, index|
      if Time.parse(date['start_date']) <= Time.parse(day) && Time.parse(date['end_date']) >= Time.parse(day)
        entry = index
      end
    end
    return 'ERROR: Out of time' if entry < 0
    JSON.parse(tax)['prices'].each do |clients|
      if clients["#{type_of_partner}"]
        clients["#{type_of_partner}"].each do |groups_prices|
          groups_prices.each do |group_name,v|
            return v[entry] if group == group_name
          end
        end
      end
    end
  end

  def what_classes_has(class_name)
    classes=[]
    JSON.parse(tax)['groups'].each do |groups|
      if groups['name'] == what_group_has("#{class_name}")
        classes << groups['classes']
      end
    end
    classes.first
  end

  private
  def end_after_start
    errors.add(:end_date, 'must be after to the start date') if end_date < start_date
  end

  def end_start_before_today
    errors.add(:start_date, 'must be after today') if self.start_date < Time.now
    errors.add(:end_date, 'must be after today') if self.end_date < Time.now
  end

  def what_group_has(class_name)
    JSON.parse(tax)['groups'].each do |groups|
      groups['classes'].each do |classes|
        return groups['name'] if classes == class_name
      end
    end
  end

end
