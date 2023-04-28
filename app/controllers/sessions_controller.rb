class SessionsController < ApplicationController
  skip_before_action :login_required
  skip_before_action :verify_authenticity_token # postmanでログインできる様にするため

  def new
    @session = SessionsForm.new
  end

  def create
    @session = SessionsForm.new(session_params)
    user = User.find_by(email: @session.email)

    if @session.save! && user&.authenticate(@session.password)
      session[:user_id] = user.id

      redirect_to root_path, notice: 'ログインしました'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    respond_to do |format|
      # status: :see_other が必須！！
      format.html { redirect_to root_path, notice: 'ログアウトしました', status: :see_other }
      format.json { head :no_content }
    end
  end

  def session_params
    params.require(:sessions_form).permit(:email, :password)
  end
end
