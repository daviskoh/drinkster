module ApiSpecHelper
  def request_headers
    { "Accept" => "application/json", "Content-Type" => "application/json" }
  end

  def api_login
    post '/api/session',
    { email: 'bob@bob.com', password: 'bob' }.to_json,
    { "Accept" => "application/json", "Content-Type" => "application/json" }
  end
end