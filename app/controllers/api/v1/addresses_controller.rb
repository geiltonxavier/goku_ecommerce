class Api::V1::AddressesController < Api::V1::BaseController

  def index
    address = Address.get_address_by_zip_code(params[:zip_code])

    if address.present?
      render json: address.to_json
    else
      render json: { text: "not found" }, status: 404
    end
  end   

end