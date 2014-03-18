FactoryGirl.define do 
  factory :user do 
    email 'bob@bob.com'
    password  'bob'
    password_confirmation 'bob'
  end
end