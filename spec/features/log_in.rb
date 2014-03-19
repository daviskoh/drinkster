require 'spec_helper'

describe 'log in', js: true do 
  before :each do
    User.destroy_all # accidentally preceded?

    FactoryGirl.create :user

    visit '/session/new'
  end

  it 'allows a user to log in' do
    within 'form.sign-in' do 
      fill_in :email, with: 'bob@bob.com'
      fill_in :password, with: 'bob'

      click_button 'Sign In'
    end

    expect(page).to have_content 'Log Out'
  end
end