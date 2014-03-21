FactoryGirl.define do 
  factory :ingredient do 
    name 'whiskey'
  end

  factory :ingredient2, class: Ingredient do 
    name 'gin'
  end

  factory :ingredient3, class: Ingredient do 
    name 'tonic water'
  end
end