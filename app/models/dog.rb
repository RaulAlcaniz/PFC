class Dog < ActiveRecord::Base
  belongs_to :dogable, polymorphic: true
  belongs_to :person
  has_many :enrolments
  has_many :exhibitions, :through => :enrolments

  validates :name, presence: true

  def how_many_months(date1, date2)
    (date2.year - date1.year) * 12 + date2.month - date1.month - (date2.day >= date1.day ? 0 : 1)
  end

  define_method('what_classes?'){ |date|
    months = how_many_months((self.date_of_birth).to_datetime,DateTime.parse(date))
    classes=['Working']
    [
        ['Baby',3,5],
        ['Puppy',5,9],
        ['Junior',9,18],
        ['Intermediate',15,24],
        ['Open',15,96],
        ['Veteran',96,240]
    ].each do |type, min, max|
      classes << type if min < months and max > months
    end
      classes << 'Champion' if self.titles != ''
      classes
  }

=begin  attr_accessor :dogable_variety, :dogable_breed, :dogable_subvariety

  def dogable_variety
    self.dogable.id if self.dogable.is_a? Variety
  end

  def dogable_breed
    self.dogable.id if self.dogable.is_a? Breed
  end

  def dogable_subvariety
    self.dogable.id if self.dogable.is_a? Subvariety
  end

  protected
  def assign_dogable
    if !@dogable_variety.blank? && !@dogable_subvariety.blank? && !@dogable_breed.blank?
      errors.add(:dogable, "can't have both a domain and a service")
    end

    unless @dogable_breed.blank?
      self.dogable = Breed.find(@dogable_breed)
    end

    unless @dogable_variety.blank?
      self.dogable = Variety.find(@dogable_variety)
    end

    unless @dogable_subvariety.blank?
      self.dogable = Subvariety.find(@dogable_subvariety)
    end
  end
=end


end
