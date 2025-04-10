class ChangeMobileToBigintInSuppliers < ActiveRecord::Migration[7.2]
  def change
    change_column :suppliers, :mobile, :bigint
  end
end
