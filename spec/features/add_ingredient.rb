require 'spec_helper'

describe 'add ingredient', js: true do 
  before :each do
    User.destroy_all # accidentally preseeeded?

    FactoryGirl.create :user

    user_login
  end

  it 'allows a user to add an ingredient'
end