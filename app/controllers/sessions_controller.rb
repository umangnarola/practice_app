class SessionsController < ApplicationController
  
  def create
    user = User.from_omniauth(request.env["omniauth.auth"])

    #if user.valid?
    session[:user_id] = user.id
    #redirect_to root_path
    redirect_to request.env['omniauth.origin']

end

  def destroy
    session[:user_id] = nil
    sleep 3
    redirect_to root_url
  end
end
