class Customer < ApplicationRecord
  belongs_to :supplier
  belongs_to :area
  has_many :bookings, dependent: :destroy

  def name_with_email
    "#{name} (#{email})"
  end
end
