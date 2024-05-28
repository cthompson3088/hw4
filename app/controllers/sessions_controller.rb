class SessionsController < ApplicationController
  

  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if @user["password"] == params["password]"]
        # loin the user
        flash["notice"] = "You've logged in."
        redirect_to "/companies"
      else
        flash["notice"] = "Unsuccessful login. Password incorrect"
        redirect_to "/sessions/new"
      end
    else
      flash["notice"] = "Unsuccessful login. User doesn't exist"
      redirect_to "/sessions/new"
    end
  end

  def destroy
  end
end
  