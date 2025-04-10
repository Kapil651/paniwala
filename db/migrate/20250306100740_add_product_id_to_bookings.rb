class AddProductIdToBookings < ActiveRecord::Migration[7.2]
  def change
    add_column :bookings, :inventori_id, :string
  end
end
