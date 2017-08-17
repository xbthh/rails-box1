class Admin::UsersController < AdminController

  #skip_before_filter :verify_authenticity_token

  before_action :require_admin!

  def index
    #@users = User.all
    #用这种方式可以防止 N+1 Query 问题
    @users = User.includes(:groups).all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  protected
  def user_params
    #params.require(:user).permit(:email, :group_ids => [])
    params.require(:user).permit(:email, :role, :group_ids => [])
  end

end
