class DogsController < ApplicationController

  before_action :set_person, only: [:new, :create]
  before_action :set_dog, only: [:show]

  def new
    @dog = @person.dogs.new
    @breed_form = @variety_form = ''
  end

  def create
    @dog = @person.dogs.build(dog_params)
    @dog.dogable = Subvariety.find_by_id(params[:subvariety]) ||
        Variety.find_by_id(params[:variety]) ||
        Breed.find_by_id(params[:breed])

    if Subvariety.where(variety_id: params[:variety]).first != nil
      flash[:alert] = 'Select the subvariety'
      @variety_form = params[:variety]
      render 'new'
    elsif Variety.where(breed_id: params[:breed]).first != nil
      flash[:alert] = 'Select the variety'
      @breed_form = params[:breed]
      render 'new'
    elsif @dog.save
      flash[:notice] = 'Dog has been created.'
      redirect_to [@person, @dog]
    else
      flash[:alert] = 'Dog has not been created.'
      render 'new'
    end



=begin    if @dog.save
      flash[:notice] = 'Dog has been created.'
      redirect_to [@person, @dog]
    else
      flash[:alert] = 'Dog has not been created.'
      render 'new'
    end
=end
  end

  private
  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_dog
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :titles, :sire, :dam, :sex, :date_of_birth)
  end

end
