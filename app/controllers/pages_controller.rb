class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:secret]
  before_action :authenticate_user!, :redirect_unless_admin,  except: [:new, :create, :edit, :destroy, :update]
  def index
    @users = User.all.paginate :page => params[:page], :per_page => 5
  end
  def updateuserstatus
    @user_update = User.find(params[:u_id])
    if @user_update.is_active == true
       @user_update.update!(is_active: false)
    else
       @user_update.update!(is_active: true)
    end
    respond_to do |format|
      format.js
    end
  end

  def redirect_unless_admin
    unless current_user.role == "admin"
      redirect_to prodacts_path
      flash[:error] = "No Access Rights"
    end
  end

end
