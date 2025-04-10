class Supplier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :customers, dependent: :destroy
  has_many :areas, dependent: :destroy
  has_many :inventories, class_name: 'Inventory', dependent: :destroy
  has_many :bookings, dependent: :destroy
  mount_uploader :image, ImageUploader
end
