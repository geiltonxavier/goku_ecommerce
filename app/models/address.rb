class Address < ApplicationRecord
  validates :zip_code, :street, :state, :city, :neighborhood, presence: true
  validates :zip_code, uniqueness: true
  validates :zip_code, length: { minimum: 8, maximum: 8 }


  def self.get_address_by_zip_code(zip_code)
    zip_code = zip_code.gsub(/[^\d]/, '') if zip_code    
    if not zip_code.blank?
      Address.where(zip_code: zip_code)
    else
      Address.all
    end
  end  
end
