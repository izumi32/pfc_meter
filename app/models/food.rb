class Food < ApplicationRecord
  belongs_to :user
  validates :food_name, presence: true
  validates :protein, presence: true
  validates :fat, presence: true
  validates :carbohydrate, presence: true
  validates :date, presence: true
  validates :amount, presence: true
end
