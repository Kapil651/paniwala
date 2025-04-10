class FixReviceColumnInBookings < ActiveRecord::Migration[7.2]
  def change
    rename_column :bookings, :revice, :receive
  end
end
