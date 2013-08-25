class HomeController < ApplicationController
  def index
      @users = User.all
  end

  def search
    result = Geocoder.search(params[:location]).first
    @lat = result.latitude #created a lat and long variable to pass back to the browser
    @long = result.longitude

    respond_to do |format|
      format.json{
        render :json => {
          :latitude => @lat,
          :longitude => @long,
        }
      }
    end
  end

  def about
  end

  def works
  end

  def contact
  end

  def quizzes
  end
end