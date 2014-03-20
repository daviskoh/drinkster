require 'spec_helper'

describe 'log out', js: true do 
  before :each do
    User.destroy_all # accidentally preseeded?

    FactoryGirl.create :user

    user_login

    click_link 'Log Out'
  end

  it 'allows a user to log out' do
    expect(page).to have_content 'Log In'
  end

  it 'redirects to login page' do 
    within 'div.large-6' do 
      expect(page).to have_content 'Log In'
    end
  end
end