require 'spec_helper'

describe 'log in', js: true do 
  before :all do 
    FactoryGirl.create(:user)
  end

  after :all do 
    User.destroy_all
  end

  before :each do
    user_login
  end

  it 'allows a user to log in' do
    expect(page).to have_content 'Log Out'
  end

  it "redirects to the user's page" do 
    expect(page).to have_content 'Welcome bob@bob.com'
  end
end