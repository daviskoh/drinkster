require 'spec_helper'

describe Ingredient do
  let(:ingredient) { FactoryGirl.create :ingredient }
   
  it { should validate_presence_of :name }

  it { should validate_uniqueness_of :name }

  it { should have_and_belong_to_many(:users) }

  it { should have_many(:drinks).through(:components) }

  it 'should be able to check whether an ingredient exists' do 
    expect(Ingredient.exist?(ingredient.name)).to be_true
  end

  describe '#parts_of' do 
    let(:gin_tonic) { FactoryGirl.create :gin_tonic }
    let(:gin) { FactoryGirl.create :ingredient2 }
    let(:tonic) { FactoryGirl.create :ingredient3 }

    after :all do 
      Component.destroy_all
    end

    before :each do 
      Component.destroy_all

      gin_tonic.ingredients << gin
      gin_tonic.ingredients << tonic

      component = Component.first
      component.parts = 3
      component.save
    end

    it 'should tell how many parts of itself are required to make a drink' do 
      expect(gin.parts_of(gin_tonic)).to eq 3
    end
  end
end