require 'spec_helper'

describe 'sign up', js: true do 
  before :each do
    visit '/user/new'
  end

  after :each do 
    User.destory_all
  end

  it 'should create a new user' do
    within 'form.new-user' do 
      fill_in :email, with: 'bob@bob.com'
      fill_in :password, with: 'bob'
      fill_in :password_confirmation, with: 'bob'

      click_button 'Sign Up'
    end

    expect(User.last.email).to eq('bob@bob.com')
  end
end