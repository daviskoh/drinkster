require 'spec_helper'

describe 'sign up', js: true do 
  after :all do 
    User.destroy_all
  end

  before :each do
    create_user('d')
  end

  it 'should create a new user' do
    expect(User.last.email).to eq('d@d.com')
  end

  it 'should redirect to log in page' do 
    within 'div.large-6' do 
      expect(page).to have_content 'Log In'
    end
  end
end