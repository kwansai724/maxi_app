class UsersController < ApplicationController
  before_action :set_user

  def edit
    @users_form = UsersForm.new(user: @user)
  end

  def update
    @users_form = UsersForm.new(update_params, user: @user)

    if @users_form.save!
      redirect_to root_path, notice: '編集を保存しました'
    else
      render :edit
    end
  end

  private

  def update_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
