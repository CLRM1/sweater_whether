require 'rails_helper'

RSpec.describe 'Road Trip API' do
  #     POST /api/v1/road_trip
  # Content-Type: application/json
  # Accept: application/json
  
  # body:
  
  # {
  #   "origin": "Denver,CO",
  #   "destination": "Pueblo,CO",
  #   "api_key": "jgn983hy48thw9begh98h4539h4"
  # }
#  response:
  # {
  #   "data": {
  #     "id": null,
  #     "type": "roadtrip",
  #     "attributes": {
  #       "start_city": "Denver, CO",
  #       "end_city": "Estes Park, CO",
  #       "travel_time": "2 hours, 13 minutes"
  #       "weather_at_eta": {
  #         "temperature": 59.4,
  #         "conditions": "partly cloudy with a chance of meatballs"
  #       }
  #     }
  #   }
  # }

  it 'returns road trip information in the correct format' do
    
    headers = {
      "Content-Type": "application/json",
      "Accept": "application/json"
    }

    body = {
      "origin": "Denver,CO", 
      "destination": "Pueblo,CO",
      "api_key": "n3zhtreTKr3Veux1Ddmnjw"
    }

    post '/api/v1/road_trip', headers: headers, params: JSON.generate(body)
    
    response_data = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response_data[:data]).to be_a(Hash)
    expect(response_data[:data][:id]).to eq(nil)
    expect(response_data[:data][:type]).to eq('roadtrip')
    expect(response_data[:data][:attributes]).to be_a(Hash)
    expect(response_data[:data][:attributes][:start_city]).to eq('Denver, CO')
    expect(response_data[:data][:attributes][:end_city]).to eq('Pueblo,CO')
    expect(response_data[:data][:attributes][:travel_time]).to eq('1 hour, 44 minutes')
    expect(response_data[:data][:attributes][:weather_at_eta]).to be_a(Hash)
    expect(response_data[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Integer)
    expect(response_data[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    

  end
end