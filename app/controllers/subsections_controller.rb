class SubsectionsController < ApplicationController

  before_action :set_section, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_subsection, only: [:show, :edit, :update, :destroy]

  def new
    @subsection = @section.subsections.build
  end

  def create
    @subsection = @section.subsections.build(subsec_params)
    if @subsection.save
      flash[:notice] = 'Subsection has been created.'
      redirect_to [@group, @section]
    else
      flash[:alert] = 'Subsection has not been created.'
      render 'new'
    end
  end

  def update
    if @subsection.update_attributes(subsec_params)
      flash[:notice] = 'Subsection has been updated.'
      redirect_to [@group, @section]
    else
      flash[:alert] = 'Subsection has not been updated.'
      render 'edit'
    end
  end

  def destroy
    if @subsection.destroy
      flash[:notice] = 'Subsection has been deleted.'
      redirect_to [@group, @section]
    else
    end
  end

  private

  def set_section
    @group = Group.find(params[:group_id])
    @section = @group.sections.find(params[:section_id])
  end

  def set_subsection
    @subsection = @section.subsections.find(params[:id])
  end

  def subsec_params
    params.require(:subsection).permit(:name, :description)
  end

end
