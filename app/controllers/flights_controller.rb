class FlightsController < ApplicationController
  before_action :fetch_search_results, only: [:index]

  def index
    # grabs all airport records and puts name and id's into a 2d array i.e: [[airport.name1, airport.id], [airport.name2, airport.id], etc..]]
    @airport_options = Airport.pluck(:name, :id).sort

    # grab only start:datetime and put into array > converts from datetime to date > removes duplicate date
    # entries > creates new nested array that is ideal for Views "select" method
    @date_options = Flight.pluck(:start).map(&:to_date).uniq.sort.map { |d| [d.strftime('%m/%d/%Y'), d] }
  end

  private

  def fetch_search_results
    # want this to run ONLY if search params have been provided. aka run if form has been submitted. If not, return
    return if search_params.empty?

    @flight_search_results = Flight.where(departure_id: search_params[:departure_id],
                                          arrival_id: search_params[:arrival_id])
                                   .where(start: Date.parse(search_params[:start]).all_day).order(:start)
  end

  def search_params
    params.permit(:departure_id, :arrival_id, :start, :passenger_count)
  end
end
