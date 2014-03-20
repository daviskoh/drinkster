require 'spec_helper'

describe 'sign up', js: true do 
  before :each do
    visit '/users/new'

    within 'form.new-user' do 
      fill_in :email, with: 'd@d.com'
      fill_in :password, with: 'd'
      fill_in :password_confirmation, with: 'd'

      click_button 'Sign Up'
    end
  end

  it 'should create a new user' do
    # buggy PG connection thus must envoke User before calling necessary info
    User.count

    sleep 1

    expect(User.last.email).to eq('d@d.com')
  end

  it 'should redirect to log in page' do 
    within 'div.large-6' do 
      expect(page).to have_content 'Log In'
    end
  end
end