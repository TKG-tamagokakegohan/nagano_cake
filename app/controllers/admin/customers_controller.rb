class Admin::CustomersController < ApplicationController
before_action :authenticate_admin!

  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報の編集が完了しました。"
      redirect_to admin_customer_path(@customer)
      #redirect_to "/admin/customers/:id"
    else
      flash[:error] = "会員情報の編集に失敗しました。"
      render :edit
    end
  end

  def order
    @customer = Customer.find(params[:id])
    @orders = @customer.orders.page(params[:page]).per(10)
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kata, :first_name_kata, :post_code, :address, :phone_number, :email, :is_active)
  end

end
