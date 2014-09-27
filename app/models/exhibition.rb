class Exhibition < ActiveRecord::Base
  validates :name, presence: true
  validate :end_after_start
  validate :end_start_before_today
  validates :start_date, :end_date, :presence => true

  private
  def end_after_start
    errors.add(:end_date, 'must be after to the start date') if end_date < start_date
  end

  def end_start_before_today
    errors.add(:start_date, 'must be after today') if self.start_date < DateTime.now
    errors.add(:end_date, 'must be after today') if self.end_date < DateTime.now
  end

end
