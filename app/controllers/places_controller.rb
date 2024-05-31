class PlacesController < ApplicationController

  def index
    @entries = Entry.where({ "user_id" => session["user_id"] })
    
    @place_ids = @entries.pluck("place_id")

    ## RETURNS LIST OF PLACE OBJECTS
    @places = Place.where({"id" => @place_ids})

  end

  def show
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"] })
  end

  def new
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places/#{@place["id"]}"
  end

end
