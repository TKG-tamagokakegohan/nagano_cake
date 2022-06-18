# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  #退会フラグ
  before_action :customer_state, only: [:create]


  protected
  #private?

  #退会しているかを判断する
  def customer_state
    #入力されたemailからアカウントを1件取得
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    #return if!@customer
    if @customer
     #取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別 && メソッドがfalseであるかどうかを確認
     if @customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false)
      flash[:error] = "退会済みです。"
      redirect_to new_customer_session_path
     end
    else
      flash[:error] = "必須項目を入力してください。"
    end

  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  #protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

end
