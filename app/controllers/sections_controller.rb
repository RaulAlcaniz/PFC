class SectionsController < ApplicationController

  before_action :set_group, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @section = @group.sections.build
  end

  def create
    @section = @group.sections.build(section_params)
    if @section.save
      flash[:notice] = 'Section has been created.'
      redirect_to [@group, @section]
    else
      flash[:alert] = 'Section has not been created.'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @section.update_attributes(section_params)
      flash[:notice] = 'Section has been updated.'
      redirect_to [@group, @section]
    else
      flash[:alert] = 'Section has not been updated.'
      render 'edit'
    end
  end

  def destroy
    if @section.destroy
      flash[:notice] = 'Section has been deleted.'
      redirect_to @group
    else
    end
  end

  private
  def set_group
    @group = Group.find(params[:group_id])
  end

  def set_section
    @section = @group.sections.find(params[:id])
  end

  def section_params
    params.require(:section).permit(:name, :description)
  end
end