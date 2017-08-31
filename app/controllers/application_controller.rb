class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, :current_user
  helper_method :current_order

  def after_sign_in_path_for(current_user)
   if current_user.role == 'admin'
     pages_index_path
    else
     prodacts_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname,:is_active,:role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname,:is_active,:role])
  end

  def new_session_path(scope)
    new_user_session_path
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      UserNotifier.send_signup_email(@user).deliver
      redirect_to(@user, :notice => 'User created')
    else
      render :action => 'new'
    end
  end
end
