require 'spec_helper'

describe Ingredient do 
  let(:ingredient) { FactoryGirl.create :ingredient }

  it { should validate_presence_of :name }

  it { should validate_uniqueness_of :name }

  it { should have_and_belong_to_many(:users) }
end