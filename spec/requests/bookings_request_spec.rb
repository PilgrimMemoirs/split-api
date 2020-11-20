require 'rails_helper'

RSpec.describe "Bookings", type: :request do
  let!(:trip) { create(:trip) }
  let!(:guest) { create(:guest) }
  let!(:bookings) {create_list(:booking, 20, trip_id: trip.id, guest_id: guest.id, nights: [1,2,3]) }
  let(:trip_id) { trip.id }
  let(:id) { bookings.first.id }

  describe 'GET /trips/:trip_id/bookings' do
    before { get "/trips/#{trip_id}/bookings"}

    context 'when trip exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all trip bookings' do
        expect(json.size).to eq(20)
      end
    end

    context 'when trip does not exist' do
      let(:trip_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Trip/)
      end
    end
  end

  describe 'GET /trips/:trip_id/bookings/:id' do
    before { get "/trips/#{trip_id}/bookings/#{id}"}

    context 'when trip booking exists' do
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns the booking' do
        expect(json['booking']['id']).to eq(id)
      end
    end

    context 'when trip booking does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Booking/)
      end
    end
  end

  describe 'POST /trips/:trip_id/bookings' do
    let(:valid_attributes) { { nights: '[1, 2, 3]', email: "guest@mail.com", name: "guest 1" } }

    context 'when the request attributes are valid' do
      before { post "/trips/#{trip_id}/bookings", params: valid_attributes }

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when an invalid request' do
      before { post "/trips/#{trip_id}/bookings", params: {} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Validation failed: Guest must exist, Nights can't be blank/)
      end
    end
  end

  describe 'PUT /trips/:trip_id/bookings/:id' do
    let(:valid_attributes) { { cost: 500 } }

    before { put "/trips/#{trip_id}/bookings/#{id}", params: valid_attributes }

    context 'when booking exists' do
      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end

      it 'updates the booking' do
        update_booking = Booking.find(id)
        expect(update_booking.cost).to match(500)
      end
    end

    context 'when the booking does not exist' do
      let(:id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Booking/)
      end
    end
  end

  describe 'DELETE /trips/:id/bookings/:id' do
    before { delete "/trips/#{trip_id}/bookings/#{id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
