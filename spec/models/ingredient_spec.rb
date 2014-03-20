require 'spec_helper'

describe Ingredient do 
  let(:ingredient) { FactoryGirl.create :ingredient }

  it { should validate_presence_of :name }

  it { should validate_uniqueness_of :name }
end