 class ZipCodeSearchFromCorreio
	  require 'correios-cep'
	  
      include ActiveModel::Validations
	  validates :zip_code, presence: true
	  validates :zip_code, length: { minimum: 8, maximum: 8 }

	  attr_accessor :zip_code
	  
	  def initialize(zip_code)
        @zip_code = zip_code.gsub(/[^\d]/, '')      
      end

	  def get_address  	
	    Correios::CEP::AddressFinder.get(@zip_code)
	  end
 end