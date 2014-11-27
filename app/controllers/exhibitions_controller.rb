class ExhibitionsController < ApplicationController

  require 'builder'
  before_action :set_exhibition, only: [:show, :destroy, :edit, :update, :destroy]

  def new
    @exhibition = Exhibition.new
  end

  def index
    @exhibitions = Exhibition.all
  end

  #def show
  #
  #  data = [@exhibition.prices_hash]
  #  @xm = Builder::XmlMarkup.new(:indent => 2)
  #  @xm.table {
  #    @xm.tr { data[0].keys.each { |key| @xm.th(key)}}
  #    data.each { |row| @xm.tr { row.values.each { |value| @xm.td(value)}}}
  #  }
  #
  #  #get_prices_table @exhibition.prices_hash
  #end

  def create
    @exhibition = Exhibition.new(exhibition_params)
    if @exhibition.save
      flash[:notice] = 'Exhibition has been created.'
      redirect_to @exhibition
    else
      flash[:alert] = 'Exhibition has not been created.'
      render 'new'
    end
  end

  def update
    if @exhibition.update_attributes(exhibition_params)
      flash[:notice] = 'Exhibition has been updated.'
      redirect_to @exhibition
    else
      flash[:alert] = 'Exhibition has not been updated.'
      render 'edit'
    end
  end

  def destroy
    if @exhibition.destroy
      flash[:notice] = 'Exhibition has been deleted.'
      redirect_to exhibitions_path
    else
    end
  end

  private

  def set_exhibition
    @exhibition = Exhibition.find(params[:id])
  end

  def exhibition_params
    params.require(:exhibition).permit(:name, :description, :start_date, :end_date)
  end

  #def get_prices_table (prices)
  #
  #end
end
