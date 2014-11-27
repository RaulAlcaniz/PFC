class Enrolment < ActiveRecord::Base
  #validates :dog_id, presence: true
  validate :check_class
  validates :dog_id, :uniqueness => {:scope => :dog_class, :message => 'Your dog has already been enrolled for this class in this exhibition'}

  belongs_to :dog
  belongs_to :exhibition

  def how_many_dogs_for_this_exhibition(grouped_classes, owner_id)
    dogs_number= 0
    Enrolment.all.find_all{|i| i.dog_owner == owner_id}.
        find_all{|i| grouped_classes.include? "#{i.dog_class}"}.each{dogs_number += 1}
    dogs_number
  end

  def dog_owner
    Dog.find_by(:id => self.dog_id).person_id
  end

  private
  # Errores de si el perro no ha sido seleccionado, o si la clase no está permitida para un perro
  def check_class
    if self.dog_id
      errors.add(:dog_class, 'Your dog is not accepted for this class') if not class_allowed
    else
      errors.add(:dog, 'You have to select a dog')
    end
  end

  # Comprueba si la clase seleccionada está permitida para el perro seleccionado.
  # Se comprueba la fecha en base a la fecha de comienzo de la exibición.
  def class_allowed
    (Dog.find(self.dog_id).what_classes? "#{((Exhibition.find(self.exhibition_id).start_date)).to_date}").include? self.dog_class
  end


end
