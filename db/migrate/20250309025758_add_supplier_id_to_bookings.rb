class AddSupplierIdToBookings < ActiveRecord::Migration[7.2]
  def change
    add_column :bookings, :supplier_id, :integer
  end
end
