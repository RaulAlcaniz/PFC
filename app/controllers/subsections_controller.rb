class SubsectionsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]
  before_action :set_section, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_subsection, only: [:show, :edit, :update, :destroy]
  before_action :set_person, only: [:new, :create, :update, :edit, :destroy]
  before_action :authorize_admin, only: [:new, :create, :update, :edit, :destroy]

  def new
    @subsection = @section.subsections.build
  end

  def create
    @subsection = @section.subsections.build(subsec_params)
    if @subsection.save
      flash[:notice] = 'Subsection has been created.'
      redirect_to [@section, @subsection]
    else
      flash[:alert] = 'Subsection has not been created.'
      render 'new'
    end
  end

  def update
    if @subsection.update_attributes(subsec_params)
      flash[:notice] = 'Subsection has been updated.'
      redirect_to [@section, @subsection]
    else
      flash[:alert] = 'Subsection has not been updated.'
      render 'edit'
    end
  end

  def destroy
    if @subsection.destroy
      flash[:notice] = 'Subsection has been deleted.'
      redirect_to [@section.group, @section]
    else
    end
  end

  private

  def set_section
    @section = Section.find(params[:section_id])
  end

  def set_subsection
    @subsection = @section.subsections.find(params[:id])
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

  def subsec_params
    params.require(:subsection).permit(:name, :description)
  end

end
