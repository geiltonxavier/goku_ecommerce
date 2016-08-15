class Address < ApplicationRecord
  validates :zip_code, :street, :state, :city, :neighborhood, presence: true
  validates :zip_code, uniqueness: true
  validates :zip_code, length: { minimum: 8, maximum: 8 }
end
