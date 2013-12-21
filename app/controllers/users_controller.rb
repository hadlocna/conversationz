class UsersController < ApplicationController
  def new

  end

  def create

    @user = User.find_or_create_by_email(params[:user])
    if @user.valid?
      current_user_assign(@user)
      redirect_to "/"
    else
      redirect_to "/users/new"
    end

  end

  def create_login
    @user = User.find_by_email(params[:user][:email])

    if @user
      if @user.authenticate(params[:user][:password])
        current_user_assign(@user)

        redirect_to "/"
      end

    else
      redirect_to :action => 'login'
    end
  end

  def login
  end

  def index

  end

  def logout
    logout_user
    redirect_to "/"
  end

  def show

  end

  def edit

  end

  def update

  end

  def destroy

  end

end
