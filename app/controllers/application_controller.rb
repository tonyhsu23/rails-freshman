class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

  def login_required
  	if current_user.blank?
  	  flash[:notice] = "Please Log In to Proceed."
  	  redirect_to new_user_session_path		
  	end  	
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:name, :email, 
      :password, :password_confirmation)}
  end

end
