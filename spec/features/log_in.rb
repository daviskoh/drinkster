require 'spec_helper'

describe 'log in', js: true do 
  before :each do
    User.destroy_all # accidentally preceded?

    FactoryGirl.create :user

    user_login
  end

  it 'allows a user to log in' do
    expect(page).to have_content 'Log Out'
  end

  it "redirects to the user's page" do 
    expect(page).to have_content 'Welcome bob@bob.com'
  end
end