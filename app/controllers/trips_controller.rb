class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :update, :destroy]

  def index
    @trips = Trip.all
    json_response(@trips)
  end

  def create
    @trip = Trip.create!(trip_params)
    json_response(@trip, :created)
  end

  def show
    json_response(@trip)
  end

  def update
    @trip.update(trip_params)
    head :no_content
  end

  def destroy
    @trip.destroy
    head :no_content
  end

  private

  def trip_params
    params.permit(:name)
  end

  def set_trip
    @trip = Trip.find(params[:id])
  end
end
