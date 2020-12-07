class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search]

  def home
  end

  def search
    if params[:query].present?
      @results = Offer.ominisearch(params[:query])
    else
      # If query is empty, return last ten included offers
      @results = Offer.last(10)
    end
  end
end
