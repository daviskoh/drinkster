require 'spec_helper'

describe 'Drink API' do 
  before :all do 
    @drink = FactoryGirl.create(:gin_tonic)
    @user = FactoryGirl.create(:user)

    [FactoryGirl.create(:ingredient2), FactoryGirl.create(:ingredient3)].each do |ing|
      @drink.ingredients << ing
      @user.ingredients << ing
    end
  end

  after :all do 
    Ingredient.destroy_all 
    User.destroy_all
    Drink.destroy_all
  end

  before :each do 
    api_login

    get user_drinks_path(@user.id), {}, request_headers
  end

  it 'returns list of makeable drinks' do
    resp = JSON.parse(response.body)

    expect(resp).to have(1).drink
  end

  it 'includes how much of each ingredient to make' do 
    resp = JSON.parse(response.body)

    # javascript style
    resp.first['component_list'].each do |component|
      expect(component['parts']).to_not be_nil
    end
  end
end