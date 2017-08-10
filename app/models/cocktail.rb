class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy  # @cocktail.doses.ingredients
  has_many :ingredients, through: :doses # it can be done through calling @cocktail.ingredients
  validates :name, presence: true, uniqueness: true
end
