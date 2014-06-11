class VarietiesController < ApplicationController
  before_action :set_breed, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_variety, only: [:show, :edit, :update, :destroy]

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

  def variety_params
    params.require(:variety).permit(:name)
  end

end
