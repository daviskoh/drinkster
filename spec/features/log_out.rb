require 'spec_helper'

describe 'log out', js: true do 
  before :each do
    User.destroy_all # accidentally preceded?

    FactoryGirl.create :user

    user_login
  end

  it 'allows a user to log out' do
    click_link 'Log Out'

    expect(page).to have_content 'Log In'
  end
end