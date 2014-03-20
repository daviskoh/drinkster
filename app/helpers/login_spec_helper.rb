module LoginSpecHelper
  def create_user(user = 'bob')
    visit '/users/new'

    within 'form.new-user' do 
      fill_in :email, with: "#{user}@#{user}.com"
      fill_in :password, with: "#{user}"
      fill_in :password_confirmation, with: "#{user}"

      click_button 'Sign Up'
    end
  end

  def user_login
    visit '/session/new'

    within 'form.sign-in' do 
      fill_in :email, with: "bob@bob.com"
      fill_in :password, with: "bob"
    end

    click_button 'Sign In'
  end
end