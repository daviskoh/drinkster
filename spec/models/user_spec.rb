require 'spec_helper'

describe User do 
  let(:user) { FactoryGirl.create :user }

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  it { should have_and_belong_to_many(:ingredients) }

  describe '#drinks' do 
    let(:drink) { FactoryGirl.create(:gin_tonic) }
    let(:gin) { FactoryGirl.create(:ingredient2) }
    let(:tonic) { FactoryGirl.create(:ingredient3) }
    let(:gimlet) { FactoryGirl.create(:gimlet) }
    let(:lime_juice) { FactoryGirl.create(:lime_juice) }

    after :all do 
      Ingredient.destory_all
      User.destory_all
      Drink.destory_all
    end

    before :each do
      [gin, tonic].each do |ingr|
        drink.ingredients << ingr
        user.ingredients << ingr
      end
    end

    it 'should return makeable drinks' do 
      expect(user.drinks).to have(1).drinks
      expect(user.drinks.first.name).to eq 'gin and tonic'
    end

    it 'should handle multiple makeable drinks' do 
      gimlet.ingredients << gin
      gimlet.ingredients << lime_juice

      user.ingredients << lime_juice

      expect(user.drinks).to have(2).drinks
    end
  end
end