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

  factory :lime_juice, class: Ingredient do 
    name 'lime_juice'
  end
end