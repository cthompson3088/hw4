class UsersController < ApplicationController
  
  def show
    @user = User.find_by({ "id" => params["id"] })
  end
  
  
  def new
  end

  def create
    @user = User.new

    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])

    @user["username"] = params["username"]

    @user.save
    redirect_to "/"
  end

  def show
  end

end