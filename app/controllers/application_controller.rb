class ApplicationController < ActionController::Base
 #before_action :authenticate_admin!, except: [:top, :about]
 before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
   case resource
   when Admin
    admin_items_path
   when Customer
    root_path
   end
  end

  def after_sign_out_path_for(resource)
   if resource == :admin
    new_admin_session_path
   else
    root_path
   end
  end

  protected

  #顧客側、WF3、deviceコントローラが動く前に、sign_upの際のデータ操作を許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :last_name_kata, :first_name_kata, :post_code, :address, :phone_number, :email])
  end
end
