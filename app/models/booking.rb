class Booking < ApplicationRecord
  belongs_to :customer
  belongs_to :inventory

  def calculate_total_price(inv)
    given.to_i * inv.price.to_i
  end
  
  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "customer_id", "given", "id", "inventory_id", "receive", "supplier_id", "updated_at"]
  end

end
