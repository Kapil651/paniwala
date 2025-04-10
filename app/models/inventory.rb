class Inventory < ApplicationRecord
  belongs_to :supplier
  has_many :customers, dependent: :destroy
end
