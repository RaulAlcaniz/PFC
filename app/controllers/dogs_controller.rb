class DogsController < ApplicationController

  before_action :set_person, only: [:new, :create]
  before_action :set_dog, only: [:show]

  def new
    @dog = @person.dogs.new
  end

  def create
    birth_params = params[:birth]
    date = Date.new birth_params['date(1i)'].to_i, birth_params['date(2i)'].to_i, birth_params['date(3i)'].to_i
    if params[:variety] == ''
      dogable_id = params[:breed]
      dogable_type = 'breed'
    elsif params[:subvariety] == ''
      dogable_id = params[:variety]
      dogable_type = 'variety'
    else
      dogable_id = params[:subvariety]
      dogable_type = 'subvariety'
    end

    #puts "PEPE GRILLO", dogable_id, dogable_type
    params.delete(:breed)
    params.delete(:variety)
    params.delete(:subvariety)

    @dog = @person.dogs.build(dog_params)
    @dog.date_of_birth = date
    @dog.dogable_id = dogable_id
    @dog.dogable_type = dogable_type

    if @dog.save
      flash[:notice] = 'Dog has been created.'
      redirect_to [@person, @dog]
    else
      flash[:alert] = 'Dog has not been created.'
      render 'new'
    end
  end

  private
  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.permit(:name, :titles, :sire, :dam, :sex, :birth, :breed, :variety, :subvariety)
  end

end
