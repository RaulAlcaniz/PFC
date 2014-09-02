class Dog < ActiveRecord::Base
  belongs_to :dogable, polymorphic: true
  belongs_to :person

  validates :name, presence: true

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
