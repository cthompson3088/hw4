class UsersController < ApplicationController
  
  def show
    @user = User.find_by({ "id" => params["id"] })
  end
  
  
  def new
  end

  def create
    @user = User.new
    @user["first_name"] = params["first_name"]
    @user["last_name"] = params["last_name"]
    @user["email"] = params["email"]
    @user["password"] = params["password"]

    @user["username"] = params["username"]

    @user.save
    redirect_to "/"
  end

  def show
  end

end