class AddImageToSuppliers < ActiveRecord::Migration[7.2]
  def change
    add_column :suppliers, :image, :string
  end
end
