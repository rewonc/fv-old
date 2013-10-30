class PlacesController < ApplicationController
    http_basic_authenticate_with name: "orange1", password: "orangutan", except: [:show]
  def index
  	@places = Place.all
  end

  def new
  end

  def edit
        @place = Place.find(params[:id])
  end

  def create
  	@place = Place.new(place_params)
	  @place.save
	  redirect_to @place
  end

  def show
  	@place = Place.find(params[:id])
    #will add in these functions later, for now will hardcode
    #week = @place.week.current
    #lastweek = @place.week.last
    #views will call these functions later, but for now we hardcode and pass them from the controller
    #@weekfarms => Farm.farms_listing_this_week
    #each of those farms, in addition to their normal information, has an array of products, which are called by 
    #  Farm.products_at_market_this_week(week, market) should replace what we're doing right now, which is just farm.products
    weekfarms = Farm.all 

    #assume week is inactive for now (>24 hours before market open?)
    @week = {day: "Saturday", date: "November 2, 2013", market: @place, farms: weekfarms, active: false}

    lastweekfarms = Farm.all 
 
    @lastweek = {day: "Saturday", date: "October 26, 2013", market: @place, farms: lastweekfarms, active: false}



    #model validation notes for later:
    #have a date/week object (belongs to market). Each date object has many products. Products belong to farms.
    #So, the controller should pass the active date object for this week, along with some logic which determines whether
    #it should be hidden or shown.
    #We need some model methods: farms_listing_this_week(market) + products_for_sale_this_week(farm, market)
    #The date object will go through and build the farm/product table for each farm that lists.
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
      end
  end

  def update
    @place = Place.find(params[:id])
    @place.update_attributes(place_params)
    redirect_to @place
  end

  private
	  def place_params
	    params.require(:place).permit(:title, :state)
	  end
end
