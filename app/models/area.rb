class Area < ApplicationRecord
  belongs_to :supplier
  has_many :customer, dependent: :destroy 
end
