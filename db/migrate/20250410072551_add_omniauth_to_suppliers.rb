class AddOmniauthToSuppliers < ActiveRecord::Migration[7.2]
  def change
    add_column :suppliers, :provider, :string
    add_column :suppliers, :uid, :string
  end
end
