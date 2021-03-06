class Enrolment < ActiveRecord::Base
  belongs_to :payment
  belongs_to :dog
  belongs_to :exhibition

  classes_not_available = ['Couple', 'Working', 'Group Breeding']
  validate :check_available_classes
  validate :check_class  # Must select a dog and class must be allowed

  validates_uniqueness_of :dog_id, :scope => :exhibition_id, unless: :skip_validation,
                          :message => 'Your dog has already been enrolled in this exhibition'

  define_method('class_available?'){|dog_class| classes_not_available.include? dog_class }

  scope :enrolled, ->(dog_id) { where(dog_id: dog_id) }
  scope :enrolled_with_class, ->(dog_id, dog_class) { enrolled(dog_id).where(dog_class: dog_class) }

  def skip_validation
    errors.include? :dog_class or
        (self.dog_class == 'Couple' && Enrolment.enrolled_with_class(self.id, self.dog_class).blank?)
  end

  def how_many_dogs_for_this_exhibition(grouped_classes, owner_id, exhibition_id)
    dogs_number= 0
    Enrolment.all.find_all{|i| i.dog_owner == owner_id and i.exhibition_id == exhibition_id}.
        find_all{|i| grouped_classes.include? "#{i.dog_class}"}.each{dogs_number += 1}
    dogs_number
  end

  def dog_owner
    Dog.try(:find_by_id, self.dog_id).person_id
    #Dog.where(id: self.dog_id).try(:person_id)
  end

  def disable_select
    self.price < 0 ? true : false if (!self.price.nil? and !errors.any?)
  end

  def enrolments_with_same_payment
    count=0
    Enrolment.all.each do |enrolment|
      count=count+1 if enrolment.payment_id == self.payment_id and Dog.try(:find_by_id, enrolment.dog_id)
    end
    count
  end

  private
  def check_available_classes
    errors.add(:dog_class, 'This class cant be selected for now. Please contact with the Webmaster') if self.class_available? self.dog_class
  end

  def check_class
    if self.dog_id
      errors.add(:dog_class, 'Must select a class or your dog is not accepted for this class') if not class_allowed and !errors.include? :dog_class
    else
      errors.add(:dog, 'You have to select a dog')
    end
  end

  # Check if selected breed is allowed for the selected dog
  # Check the date based on the start date of the exhibition
  def class_allowed
    (Dog.find(self.dog_id).what_classes? "#{((Exhibition.find(self.exhibition_id).start_date)).to_date}").include? self.dog_class
  end

end
