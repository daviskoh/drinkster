module ApiSpecHelper
  def request_headers
    { "Accept" => "application/json", "Content-Type" => "application/json" }
  end

  def user_params
    { user: {
      email: 'bob@bob.com', password: 'bob', password_confirmation: 'bob'
      }
    }.to_json
  end

  def ingredient_params
    { ingredient: { name: 'whiskey' } }.to_json
  end

  def api_login
    post '/api/session',
    { email: 'bob@bob.com', password: 'bob' }.to_json,
    { "Accept" => "application/json", "Content-Type" => "application/json" }
  end

  def add_ingredient(userID = User.last.id)
    post "/api/users/#{userID}/ingredients", self.ingredient_params, self.request_headers
  end
end