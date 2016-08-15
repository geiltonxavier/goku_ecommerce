class AddressesController < ApplicationController
  before_action :authenticate_user!

  
  def index    
    @addresses = Address.get_address_by_zip_code(params_zip_code)
  end

 
  def show
    @address = Address.find(params[:id])
  end

  
  def new
    @address = Address.new
  end

  
  def edit
    @address = Address.find(params[:id])
  end

  
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to @address, notice: 'Endereço criado com sucesso.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @address = Address.find(params[:id])
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Endereço atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Endereço deletado com sucesso' }
      format.json { head :no_content }
    end
  end

  def zip_code_search_from_correios
    zip = ::ZipCodeSearchFromCorreio.new(params_zip_code) 
     
    if zip.valid?
      render json: zip.get_address
    else
      render json: {}
    end
  end

  private  
     
    def address_params
      params.require(:address).permit(:zip_code, :street, :state, :city, :neighborhood)
    end

    def params_zip_code
       params.permit(:zip_code)[:zip_code]
    end
end
