class Supplier < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2,:github,:linkedin]
  has_many :customers, dependent: :destroy
  has_many :areas, dependent: :destroy
  has_many :inventories, class_name: 'Inventory', dependent: :destroy
  has_many :bookings, dependent: :destroy
  mount_uploader :image, ImageUploader

 def self.from_omniauth(auth)
    # Find or create a supplier using the data from the OAuth provider
    supplier = Supplier.where(email: auth.info.email).first_or_create do |user|
      user.name = auth.info.name
    user.email = auth.info.email
    user.password = Devise.friendly_token[0, 20]
    user.company_name = "N/A"     
    user.address = "Unknown"       # default if required
    user.mobile = "0000000000"     # fallback dummy number
    end
  
   supplier.update(
      provider: auth.provider,
      uid: auth.uid
    )

    supplier
  end

end
