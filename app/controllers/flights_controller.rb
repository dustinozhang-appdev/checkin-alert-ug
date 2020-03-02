class FlightsController < ApplicationController
  def index
    @upcoming_flights = @current_user.flights.where("departs_at > ?", Time.now).order({:departs_at => :asc})
    @past_flights = @current_user.flights.where("departs_at < ?", Time.now).order({:departs_at => :desc})
    render({ :template => "flights/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")
    @flight = Flight.where({:id => the_id }).at(0)

    render({ :template => "flights/show.html.erb" })
  end

  def create
    @flight = Flight.new
    @flight.departs_at = params.fetch("query_departs_at")
    @flight.description = params.fetch("query_description")
    @flight.locator = params.fetch("query_locator")
    @flight.user_id = session[:user_id]

    if @flight.valid?
      @flight.save
      redirect_to("/flights", { :notice => "Flight created successfully." })
    else
      redirect_to("/flights", { :notice => "Flight failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    @flight = Flight.where({ :id => the_id }).at(0)

    @flight.departs_at = params.fetch("query_departs_at")
    @flight.airline = params.fetch("query_airline")
    @flight.description = params.fetch("query_description")
    @flight.user_id = params.fetch("query_user_id")
    @flight.message_sent = params.fetch("query_message_sent", false)
    @flight.locator = params.fetch("query_locator")

    if @flight.valid?
      @flight.save
      redirect_to("/flights/#{@flight.id}", { :notice => "Flight updated successfully."} )
    else
      redirect_to("/flights/#{@flight.id}", { :alert => "Flight failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @flight = Flight.where({ :id => the_id }).at(0)

    @flight.destroy

    redirect_to("/flights", { :notice => "Flight deleted successfully."} )
  end
end
