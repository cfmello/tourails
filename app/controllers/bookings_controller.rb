class BookingsController < ApplicationController
  before_action :fetch_offer, except: %i[show destroy index]

  def index
    bookings = Booking.where(user: current_user, deleted: false).order(:date_start)
    @bookings_next = []
    @bookings_gone = []
    bookings.each do |book|
      book.date_start > Time.now ? @bookings_next << book : @bookings_gone << book
    end
    # @bookings_next.sort_by!(&:date_start)
    # @bookings_gone.sort_by!(&:date_start)
  end

  def new
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.offer = @offer
    @booking.user = current_user
    if @booking.save
      flash[:success] = "Booking successfully created"
      redirect_to @booking
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def update
    @booking = Booking.find(params[:id])
    if @booking.update_attributes(booking_params)
      flash[:success] = "Booking was successfully updated"
      redirect_to @booking
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.deleted = true
    if booking.save
      flash[:success] = "Booking was successfully updated"
      redirect_to offers_path
    else
      flash[:error] = "Something went wrong"
      redirect_to @booking
    end
  end

  private

  def fetch_offer
    @offer = Offer.find(params[:offer_id])
  end

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :special_request)
  end
end
