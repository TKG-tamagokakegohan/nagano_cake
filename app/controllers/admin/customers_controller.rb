class Admin::CustomersController < ApplicationController
before_action :authenticate_admin!

  def index
    @customers = Customer.all
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
      #redirect_to admin_customers_path(@customer)
      #redirect_to "/admin/customers/:id"
    else
      flash[:error] = "会員情報の編集を正常に行えませんでした。"
      render :edit
    end
  end

  private

  def cusotmer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kata, :first_name_kata, :post_code, :address, :phone_number, :email, :is_active)
  end

end
