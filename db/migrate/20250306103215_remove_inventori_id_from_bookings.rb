class RemoveInventoriIdFromBookings < ActiveRecord::Migration[7.2]
  def change
    remove_column :bookings, :inventori_id, :string
  end
end
