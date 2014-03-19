require 'spec_helper'

describe 'log out', js: true do 
  before :each do
    User.destroy_all # accidentally preceded?

    FactoryGirl.create :user

    user_login
  end

  it 'allows a user to log out' do
    within 'nav' do 
      click_button 'Log Out'
    end

    expect(page).to have_content 'Sign In'
  end
end