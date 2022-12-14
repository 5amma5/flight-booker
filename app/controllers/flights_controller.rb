class FlightsController < ApplicationController
  def index
    @airport_options = Airport.all.order(:name).map { |a| [a.name, a.id] }
    # grab only start:datetime and put into array > convert each datetime to date > remove duplicate date entries
    # in array > create new nested array that is ideal for Views "select" method
    @date_options = Flight.pluck(:start).map(&:to_date).uniq.sort.map { |d| [d.strftime('%m/%d/%Y'), d] }
    @flight = Flight.new

    unless params[:flight].nil?
      date = Date.parse(search_params[:start])
      @flight_search_results = Flight.where("departure_id = ? AND arrival_id = ?", search_params[:departure_id], search_params[:arrival_id]).where(start: date.all_day).order(:start)
    end
  end

  private

  def search_params
    params.require(:flight).permit(:departure_id, :arrival_id, :start, :passenger_count)
  end
end
