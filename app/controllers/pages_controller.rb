class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home search]

  def home
  end

  def search
    if params[:query]
      @results = Offer.ominisearch(params[:query])
    else
      @results = Offer.last(10)
    end
  end
end
