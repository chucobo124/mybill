class Bill < ApplicationRecord
  belongs_to :spend
  belongs_to :income

  def self.type
    {
      0 => Income,
      1 => Spend
    }
  end
end
