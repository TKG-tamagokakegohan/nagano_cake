class Public::CustomersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end

  def quit
  end

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
  end
end
