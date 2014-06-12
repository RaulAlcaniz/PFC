class SubvarietiesController < ApplicationController
  before_action :set_variety, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :set_subvariety, only: [:show, :edit, :update, :destroy]

  def new
    @subvariety = @variety.subvarieties.build
  end

  def create
    @subvariety = @variety.subvarieties.build(subvariety_params)
    if @subvariety.save
      flash[:notice] = 'Subvariety has been created.'
      redirect_to [@variety, @subvariety]
    else
      flash[:alert] = 'Subvariety has not been created.'
      render 'new'
    end
  end

  def update
    if @subvariety.update_attributes(subvariety_params)
      flash[:notice] = 'Subvariety has been updated.'
      redirect_to [@variety, @subvariety]
    else
      flash[:alert] = 'Subvariety has not been updated.'
      render 'edit'
    end
  end

  def destroy
    if @subvariety.destroy
      flash[:notice] = 'Subvariety has been deleted.'
      redirect_to [@variety.breed, @variety]
    else
    end
  end

  private
  def set_variety
    @variety = Variety.find(params[:variety_id])
  end

  def set_subvariety
    @subvariety = @variety.subvarieties.find(params[:id])
  end

  def subvariety_params
    params.require(:subvariety).permit(:name)
  end
end
