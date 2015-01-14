class BreedsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]
  before_action :set_breedable, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_breed, only: [:show, :edit, :update, :destroy]
  before_action :set_person, only: [:new, :create, :update, :edit, :destroy]
  before_action :authorize_admin, only: [:new, :create, :update, :edit, :destroy]

  def new
    @breed =  @breedable.breeds.build
  end

  def create
    @breed = @breedable.breeds.build(breed_params)
    if @breed.save
      flash[:notice] = 'Breed has been created.'
      redirect_to [@breedable, @breed]
    else
      flash[:alert] = 'Breed has not been created.'
      render 'new'
    end
  end

  def update
    if @breed.update_attributes(breed_params)
      flash[:notice] = 'Breed has been updated.'
      redirect_to [@breedable, @breed]
    else
      flash[:alert] = 'Breed has not been updated.'
      render 'edit'
    end
  end

  def destroy
    if @breed.destroy
      flash[:notice] = 'Breed has been deleted.'
      redirect_to [@breedable.group, @breedable] if params[:section_id]
      redirect_to [@breedable.section, @breedable] if params[:subsection_id]
    else
    end
  end

  private
  def set_breedable
    @breedable = Section.find(params[:section_id]) if params[:section_id]
    @breedable = Subsection.find(params[:subsection_id]) if params[:subsection_id]
  end

  def set_breed
    @breed = @breedable.breeds.find(params[:id])
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

  def breed_params
    params.require(:breed).permit(:name)
  end
end
