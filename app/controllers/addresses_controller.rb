class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [:show, :edit, :update, :destroy]


  def index    
    @addresses = Address.get_address_by_zip_code(params_zip_code)
  end

 
  def show
  end

  
  def new
    @address = Address.new
  end

  
  def edit
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
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Endereço deletado com sucesso' }
      format.json { head :no_content }
    end
  end

  private   
    def set_address
      @address = Address.find(params[:id])
    end

   
    def address_params
      params.require(:address).permit(:zip_code, :street, :state, :city, :neighborhood)
    end

    def params_zip_code
       params.permit(:zip_code)[:zip_code]
    end
end
