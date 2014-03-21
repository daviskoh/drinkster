require 'spec_helper'

describe Drink do 
  it { should validate_presence_of :name }

  it { should validate_uniqueness_of :name }

  it { should have_many(:ingredients).through(:components) }

  describe '#components_list' do 
    let(:gin_tonic) { FactoryGirl.create :gin_tonic }
    let(:gin) { FactoryGirl.create :ingredient2 }
    let(:tonic) { FactoryGirl.create :ingredient3 }

    before :each do 
      gin_tonic.ingredients << gin
      gin_tonic.ingredients << tonic

      Component.first.parts = 3
      Component.last.parts = 1
    end

    it 'returns a list of ingredients and their necessary amounts' do 
      expect(gin_tonic.component_list.count).to eq 2
    end
  end
end