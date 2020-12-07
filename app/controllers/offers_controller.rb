require 'open-uri'
require 'json'

class OffersController < ApplicationController
  def index
    @offers = []
    @myoffers = []
    all_offers = Offer.all
    all_offers.each do |offer|
      if offer.user != current_user && offer.active
        @offers << offer
      elsif offer.user == current_user
        @myoffers << offer
      end
    end
  end

  def show
    @offer = Offer.find(params[:id])
    @booking = Booking.new
    @bookings = fetch_bookings
  end

  def new
    @offer = Offer.new
    @cities = JSON.parse(open('https://servicodados.ibge.gov.br/api/v1/localidades/municipios').read)
                  .map { |item| item['nome'] }
    # raise
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.user_id = current_user.id
    if @offer.save
      flash[:notice] = "Muito bom. Oferta criada!"
      redirect_to offers_path
    else
      flash[:alert] = "<p>#{@offer.errors.messages.values.join('</p><p>')}</p>".html_safe
      render :new
    end
  end

  def edit
    @offer = Offer.find(params[:id])
  end

  def update
    @offer = Offer.find(params[:id])
    if @offer.update_attributes(update_params)
      flash[:notice] = "Offer was successfully updated"
      redirect_to @offer
    else
      flash[:alert] = "Something went wrong"
      render 'edit'
    end
  end

  def destroy
    @offer = Offer.find(params[:id])
    act = true
    act = false if @offer.active
    @offer.active = act
    if @offer.save
      redirect_to offers_path
    else
      render action: "show", id: @offer.id
    end
  end

  private

  def offer_params
    params.require(:offer).permit(:city, :description, :active)
  end

  def update_params
    params.require(:offer).permit(:description, :active)
  end

  def fetch_bookings
    @bookings = Booking.where(offer_id: params[:id])
  end
end
