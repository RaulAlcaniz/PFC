class PaymentsController < ApplicationController

  before_filter :authenticate_user!
  before_action :set_exhibition, only: [:new, :create, :show, :edit, :update]
  before_action :set_person, only: [:index, :new, :create, :show, :edit, :update]
  before_action :set_payment, only: [:show, :edit, :update]
  before_action :set_enrolments, only: [:new, :create, :show, :edit]
  before_action :set_price, only: [:new, :create, :edit]
  before_action :set_dogs, only: [:new, :create, :show, :edit]
  before_action :authorized_people

  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    if @payment.save
      update_enrolments
      @payment.unverified!
      flash[:notice] = 'Payment has been uploaded.'
      redirect_to exhibition_enrolments_path(@exhibition)
    else
      flash[:alert] = 'Payment has not been uploaded'
      render 'new'
    end
  end

  def edit
    if Date.today >= @exhibition.end_date and !User.find(current_user).admin?
      flash[:alert] = 'The exhibition has already finished.'
      redirect_to exhibition_enrolments_path(@exhibition)
    end
  end

  def update
    if @payment.update_attributes(payment_params)
      flash[:notice] = 'Payment has been updated.'
      if User.find(current_user).admin?
        redirect_to person_exhibition_enrolments_path(@person, @exhibition)
      else
        redirect_to exhibition_enrolments_path(@exhibition)
      end
    else
      flash[:alert] = 'Payment has not been updated.'
      render 'edit'
    end
  end

  def show
    @out_of_time = false
    @enrolments.each do |enrolment|
      if enrolment.payment_id == @payment.id
        @out_of_time = true if @exhibition.end_date < Date.today
      end
    end
  end

  def index
    if User.find(@person.user_id).admin?
      @payments = Payment.all
    else
      @payments = Payment.where(id: Enrolment.where(dog_id: Dog.where(person_id: @person.id).select(:id)).select(:payment_id))
    end
  end

  private
  def payment_params
    if User.find(current_user).admin?
      params.require(:payment).permit(:status)
    else
      params.require(:payment).permit(:amount, :comment, :receipt)
    end
  end

  def set_payment
    @payment = Payment.for(@person).find(params[:id])
  rescue ActiveRecord::RecordNotFound
     flash[:alert] = 'The payment you were looking for could not be found.'
     redirect_to root_path
  end

  def set_exhibition
    if params[:exhibition_id].present?
      @exhibition = Exhibition.find(params[:exhibition_id])
    else
      @exhibition = Exhibition.try(:find_by_id, (Enrolment.find_by_payment_id(params[:id]).try(:exhibition_id)))

      #@exhibition = Exhibition.find(Enrolment.find_by_payment_id(params[:payment_id]).exhibition_id)
    end
      #@exhibition = Exhibition.try(:find, (Enrolment.find_by_payment_id(params[:id]).try(:exhibition_id)))

  end

  def set_enrolments
    @enrolments = []
    if @exhibition
      @exhibition.enrolments.find_all{|enrolment|
        @person.dogs.each{|dog| @enrolments << enrolment if (dog.id == enrolment.dog_id)}
      }
    end
  end

  def set_price
    @price = @enrolments.find_all { |enrolment| !enrolment.payment_id }.map{|enrolment| enrolment.price}.inject(0,:+)
    @price = @payment.amount if @payment
  end

  def set_person
    if params[:id].present?
      @person = Person.find_by_id(Dog.select(:person_id).where(id: Enrolment.select(:dog_id).where(payment_id: params[:id])))
    elsif params[:person_id].present?
      @person = Person.find(params[:person_id])
    else
      @person = Person.find_by_user_id(current_user)
    end
  end

  def set_dogs
    @dogs = []
    @not_paid_dogs = []
    @same_payment_dogs = []
    @enrolments.each do |enrolment|
      @dogs << Dog.find(enrolment.dog_id)
      @not_paid_dogs << Dog.find(enrolment.dog_id) if !enrolment.payment_id
      if @payment
        @same_payment_dogs << Dog.find(enrolment.dog_id) if enrolment.payment_id == @payment.id
      end
    end
  end

  def update_enrolments
    @enrolments.each do |enrolment|
      #raise 'You have dogs already enrolled in this exhibition and you have paid for them.' if not enrolment.payment_id.blank?
      if enrolment.payment_id.blank? and @payment.id
        Enrolment.all.find_all{|entries| entries.id == enrolment.id}.each{|entry_to_update|
          entry_to_update.update_attribute(:payment_id, @payment.id)
        }
      end
    end
  end

  def authorized_people
    if @person.try(:user_id) != current_user.id
      raise(ActiveRecord::RecordNotFound) if !User.find(current_user).admin?
    end
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The payment you were looking for could not be found.'
    redirect_to root_path
  end
end