class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search]

  def home
    @results = Offer.where(active: true).last(3)
  end

  def search
    if params[:query].present?
      @results = Offer.ominisearch(params[:query]).where(active: true)
    else
      # If query is empty, return last ten included offers
      @results = Offer.last(10)
    end
  end
end
