class BookingsController < ApplicationController
  before_action :set_trip
  before_action :set_guest, only: [:create]
  before_action :set_trip_booking, only: [:show, :update, :destroy]

  def index
    json_response(@trip.bookings.to_json(include: :guest))
  end

  def show
    json_response({booking: @booking, guest: @booking.guest})
  end

  def create
    booking = @trip.bookings.new(booking_params)
    booking.guest_id = @guest.id
    booking.save!
    json_response(booking.to_json(include: :guest), :created)
  end

  def update
    @booking.update(booking_params)
    head :no_content
  end

  def destroy
    @booking.destroy
    head :no_content
  end

  private

  def booking_params
    params.permit(:nights, :paid, :cost)
  end

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def set_guest
    @guest = Guest.find_or_create_by(email: params[:email], name: params[:name])
  end

  def set_trip_booking
    @booking = @trip.bookings.find_by!(id: params[:id]) if @trip
  end
end
