require 'spec_helper'

describe Drink do 
  let(:drink) { FactoryGirl.create :drink }

  it { should validate_presence_of :name }

  it { should validate_uniqueness_of :name }

  it { should have_many(:ingredients).through(:components) }
end