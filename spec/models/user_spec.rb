require 'spec_helper'

describe User do 
  let(:user) { FactoryGirl.create :user }

  it { should validate_presence_of :email }
  it { should validate_presence_of :password }
end