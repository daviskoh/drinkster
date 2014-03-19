module LoginSpecHelper
  def user_login
    visit '/session/new'

    within 'form.sign-in' do 
      fill_in :email, with: "bob@bob.com"
      fill_in :password, with: "bob"
    end

    click_button 'Sign In'
  end
end