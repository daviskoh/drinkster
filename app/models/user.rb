class User < ActiveRecord::Base
  validates :email, :password, presence: true
  # validates :email, uniqueness: true

  has_and_belongs_to_many :ingredients

  has_secure_password

  def drinks
    # find all drinks for which user.ingredients contains drink.ingredients
    Drink.all.each_with_object([]) do |drink, drinks|
      drinks << drink if (drink.ingredients - self.ingredients).count === 0
    end
  end
end