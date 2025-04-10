class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :inventory

  def calculate_total_price(inv)
    given.to_i * inv.price.to_i
  end
  
end
