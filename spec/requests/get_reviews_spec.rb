require 'rails_helper'

describe "get all reviews route", :type => :request do
  let!(:user) { FactoryBot.create(:user) }
  let!(:destination) { FactoryBot.create(:destination) }
  let!(:reviews) { FactoryBot.create_list(:review, 20) }
  # binding.pry

  before { get '/reviews' }

  it 'returns all reviews' do
    expect(JSON.parse(response.body).size).to eq(20)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
