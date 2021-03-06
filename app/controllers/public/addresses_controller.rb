class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "新規配送先の保存が完了しました。"
      redirect_to addresses_path
    else
      @address = Address.new
      flash[:error] = "新規配送先の保存に失敗しました。"
      @addresses = current_customer.addresses
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      flash[:notice] = "配送先の編集を更新しました。"
      redirect_to addresses_path
    else
      flash[:notice] = "配送先の編集に失敗しました。"
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private

  def address_params
    params.require(:address).permit(:post_code, :address, :address_name)
  end
end
