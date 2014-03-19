require 'spec_helper'

describe 'Session API' do 
  before :each do 
    User.destroy_all
    FactoryGirl.create :user
  end

  after :each do
    User.destroy_all
  end

  let(:request_headers) {
    { "Accept" => "application/json", "Content-Type" => "application/json" }
  }

  let(:user_params) { 
    { email: 'bob@bob.com', password: 'bob' }.to_json
  }

  it 'allows you log in' do 
    post '/api/session', user_params, request_headers

    expect(response).to be_success
  end
end