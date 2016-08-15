module SearchCep
require 'correios-cep'
  def get_address_correios(zip_code)
  	@zip_code = zip_code.gsub(/[^\d]/, '')
    Correios::CEP::AddressFinder.get(@zip_code)
  end
end