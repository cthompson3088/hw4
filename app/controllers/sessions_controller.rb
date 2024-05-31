class SessionsController < ApplicationController
  

  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        # loin the user
        session["user_id"] = @user["id"]
        flash["notice"] = "You've logged in #{@user["username"]}"
        redirect_to "/places"
      else
        flash["notice"] = "Unsuccessful login. Password incorrect"
        redirect_to "/login"
      end
    else
      flash["notice"] = "Unsuccessful login. User doesn't exist"
      redirect_to "/login"
    end
  end

  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end
  