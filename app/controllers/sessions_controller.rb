class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id

      redirect_to root_path, notice: 'ログインしました'
    else
      render :new
    end
  end

  def destroy
    reset_session
    respond_to do |format|
      # status: :see_other が必須！！
      format.html { redirect_to root_path, notice: 'ログアウトしました。', status: :see_other }
      format.json { head :no_content }
    end
  end
end
