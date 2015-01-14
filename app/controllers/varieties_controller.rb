class VarietiesController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]
  before_action :set_breed, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_variety, only: [:show, :edit, :update, :destroy]
  before_action :set_person, only: [:new, :create, :update, :edit, :destroy]
  before_action :authorize_admin, only: [:new, :create, :update, :edit, :destroy]

  def new
    @variety = @breed.varieties.build
  end

  def create
    @variety = @breed.varieties.build(variety_params)
    if @variety.save
      flash[:notice] = 'Variety has been created.'
      redirect_to [@breed, @variety]
    else
      flash[:alert] = 'Variety has not been created.'
      render 'new'
    end
  end

  def update
    if @variety.update_attributes(variety_params)
      flash[:notice] = 'Variety has been updated.'
      redirect_to [@breed, @variety]
    else
      flash[:alert] = 'Variety has not been updated.'
      render 'edit'
    end
  end

  def destroy
    if @variety.destroy
      flash[:notice] = 'Variety has been deleted.'
      redirect_to [@breed.breedable, @breed]
    else
    end
  end

  private
  def set_breed
    @breed = Breed.find(params[:breed_id])
  end

  def set_variety
    @variety = @breed.varieties.find(params[:id])
  end

  def set_person
    @person = Person.find_by_user_id(current_user.id)
  end

  def authorize_admin
    raise(ActiveRecord::RecordNotFound) if not User.find(@person.user_id).admin?
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'You can\'t access to this page.'
    redirect_to root_path
  end

  def variety_params
    params.require(:variety).permit(:name)
  end

end
