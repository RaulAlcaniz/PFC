class DogsController < ApplicationController

  before_action :set_person, only: [:new, :create]
  before_action :set_dog, only: [:show]

  def new
    @dog = @person.dogs.new
    respond_to do |format|
      format.js {render partial: 'varieties', object: @dog}
      format.html { puts 'html en el new' }
    end
  end

  def create
    @dog = @person.dogs.build(dog_params)
    @dog.dogable = Subvariety.find_by_id(params[:subvariety]) ||
        Variety.find_by_id(params[:variety]) ||
        Breed.find_by_id(params[:breed])

    @breed_form = params[:breed]
    @variety_form = params[:variety]
    @subvariety_form = params[:subvariety]

    # In case of breed, variety or subvariety params are not null,
    # we should check if @dog can be saved

    if @subvariety_form == '' && Subvariety.where(variety_id: @variety_form).first != nil
      flash[:alert] = 'Select the subvariety.'
      render 'new'
    elsif @variety_form == '' && Variety.where(breed_id: @breed_form).first != nil
      flash[:alert] = 'Select the variety.'
      render 'new'
    elsif @dog.save
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
    params.require(:dog).permit(:name, :titles, :sire, :dam, :sex, :date_of_birth)
  end

end
