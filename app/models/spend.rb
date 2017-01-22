class Spend < ApplicationRecord
  has_one :category
  has_many :bills
end
