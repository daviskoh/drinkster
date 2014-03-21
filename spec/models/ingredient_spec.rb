require 'spec_helper'

describe Ingredient do 
  let(:ingredient) { FactoryGirl.create :ingredient }

  it { should validate_presence_of :name }

  it { should validate_uniqueness_of :name }

  it { should have_and_belong_to_many(:users) }

  it 'should be able to check whether an ingredient exists' do 
    expect(Ingredient.exist?(ingredient.name)).to be_true
  end
end