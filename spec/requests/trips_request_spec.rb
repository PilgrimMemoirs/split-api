require 'rails_helper'

RSpec.describe "Trips", type: :request do
  let!(:trips) { create_list(:trip, 10) }
  let(:trip_id) { trips.first.id }

  describe 'GET /trips' do
    before { get '/trips'}

    it 'returns trips' do
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /trips/:id' do
    before { get "/trips/#{trip_id}" }

    context 'when the record exists' do
      it 'returns the trip' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(trip_id)
      end

      it 'returns the status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:trip_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Trip/)
      end
    end
  end

  describe 'POST /trips' do
    let(:valid_attributes) { { name: 'Palm Springs' } }

    context 'when the request is valid' do
      before { post '/trips', params: valid_attributes }

      it 'creates a trip' do
        expect(json['name']).to eq('Palm Springs')
      end

      it 'returns a status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/trips', params: {}}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validatin failure message' do
        expect(response.body)
          .to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /trips/:id' do
    let(:valid_attributes) { { name: 'Sedona' } }

    context 'when the record exists' do
      before { put "/trips/#{trip_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns the status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  describe 'DELETE /trips/:id' do
    before { delete "/trips/#{trip_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
