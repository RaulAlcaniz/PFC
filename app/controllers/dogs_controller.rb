class DogsController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_person, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  before_action :set_dog, only: [:show, :destroy, :edit, :update]
  before_action :authorized_people, :except => [:update_varieties, :update_subvarieties]

  def new
    @dog = @person.dogs.new
  end

  def index
    @dogs = @person.dogs.all
  end

  def show
    @is_a_breed = @dog.dogable.is_a?(Breed)
    @is_a_variety = @dog.dogable.is_a?(Variety)
    @is_a_subvariety = @dog.dogable.is_a?(Subvariety)
  end

  def destroy
    if @dog.destroy
      flash[:notice] = 'Dog has been deleted.'
      redirect_to person_dogs_path
    else
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

  def edit
    # We need to know if the dog to edit has a breed, a variety or a subvariety
    # to get correctly their respective ids for fill the edit form
    if @dog.dogable.is_a? Breed
      @breed_form = @dog.dogable.get_breed.id
    elsif @dog.dogable.is_a? Variety
      @breed_form = @dog.dogable.get_breed.id
      @variety_form = @dog.dogable.get_variety.id
    elsif @dog.dogable.is_a? Subvariety
      @breed_form = @dog.dogable.get_breed.id
      @variety_form = @dog.dogable.get_variety.id
      @subvariety_form = @dog.dogable.get_subvariety.id
    end
  end

  def update
    @breed_form = params[:breed]
    @variety_form =  params[:variety] if breed_has_variety @breed_form, params[:variety]
    @subvariety_form = params[:subvariety] if variety_has_subvariety @variety_form, params[:subvariety]

    @dog.dogable = (Subvariety.find_by_id(params[:subvariety]) if variety_has_subvariety @variety_form, params[:subvariety]) ||
        (Variety.find_by_id(params[:variety]) if breed_has_variety @breed_form, params[:variety]) ||
        Breed.find_by_id(params[:breed])

    if @subvariety_form == nil && Subvariety.where(variety_id: @variety_form).first != nil
      flash[:alert] = 'Select the subvariety.'
      render 'edit'
    elsif @variety_form == nil && Variety.where(breed_id: @breed_form).first != nil
      flash[:alert] = 'Select the variety.'
      render 'edit'
    elsif @dog.update_attributes(dog_params)
      flash[:notice] = 'Dog has been updated.'
      redirect_to [@person,@dog]
    else
      flash[:notice] = 'Dog has not been updated.'
      render 'edit'
    end
  end

  # Next procedures are used for render a partial form for a dog
  # when the browser is using JavaScript
  def update_varieties
    respond_to do |format|
      format.html {
        if request.xhr?
          @selected_breed = params[:selected_breed]
          render partial: 'varieties'
        end
      }
    end
  end

  def update_subvarieties
    respond_to do |format|
      format.html {
        if request.xhr?
          @selected_variety = params[:selected_variety]
          render partial: 'subvarieties'
        end
      }
    end
  end


  private
  # breed_has_variety is used to know if a given breed has a given variety
  def breed_has_variety( breed_id, variety_id )
    Variety.where(breed_id: breed_id).where(id: variety_id).first != nil
  end

  # variety_has_subvariety is used to know if a given variety has a given subvariety
  def variety_has_subvariety( variety_id, subvariety_id )
    Subvariety.where(variety_id: variety_id).where(id: subvariety_id).first != nil
  end

  def set_person
    @person = Person.find(params[:person_id])
  end

  def set_dog
    if User.find(current_user).admin?
      @dog = Dog.find(params[:id])
    else
      @dog = Dog.for(current_user).find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'You can\'t access to this page.'
    redirect_to root_path
  end

  def dog_params
    params.require(:dog).permit(:name, :titles, :sire, :dam, :sex, :date_of_birth)
  end

  def authorized_people
    if @person.user_id != current_user.id
      raise(ActiveRecord::RecordNotFound) if not User.find(current_user).admin?
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'You can\'t access to this page.'
    redirect_to root_path
  end

end
