class SectionController < ApplicationController
  def show
  end

  def new
    @section = @group.sections.build
  end

end
