class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer

  def show
    @customer = Customer.find(params[:id])
  end

  def quit
  end

  #退会機能
  def out
    @customer = Customer.find(params[:id])
    #@customer = current_custoomer
    #is_activeカラムにフラグを立てる(defaultはtrue)
    @customer.update(is_active: false)
    #ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if  @customer.update(customer_params)
      flash[:notice] = "会員情報の編集が完了しました。"
      redirect_to customer_path(@customer.id)
    else
      flash[:error] = "会員情報の編集に失敗しました。"
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kata, :first_name_kata, :post_code, :address, :phone_number, :email)
  end

  def ensure_correct_customer
    @customer = Customer.find(params[:id])
    unless @customer == current_customer
      redirect_to root_path
    end
  end

end