class BillSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :spend
  belongs_to :income
end
