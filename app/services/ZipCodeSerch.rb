 class ZipCodeSearch
	require 'correios-cep'
	attr_accessor :zip_code

	  def initialize(zip_code)
	    @zip_code = zip_code.gsub(/[^\d]/, '')
	  end

	  def get_address
	    Correios::CEP::AddressFinder.get(@zip_code)
	  end
  end