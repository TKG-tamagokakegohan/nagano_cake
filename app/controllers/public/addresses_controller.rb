class Public::AddressesController < ApplicationController
  def index
    @address = Address.new
    #@address = Address.find(params[:id])
    @addreses = Address.all
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "保存が完了しました。"
      redirect_to address_path(@address)
    else
      @addresses = Address.new
      render :index
    end
  end

  def edit
  end

  private

  def address_params
    #!!!!!!!住所カラムも追加する!!!!
    params.require(:address).permit(:post_code, :address_name)
  end
end
