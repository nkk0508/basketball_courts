class Court < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites

  validates :name, :categories, :postal_code, :address, :location_information, :access_count, :favorite_count, presence: true
  validates :non_residents, inclusion: [true, false]

  def ward
    address = self.address
    sliced_address = address.slice(/(?<=都).*(区|市)/)
    sliced_address
  end
end

