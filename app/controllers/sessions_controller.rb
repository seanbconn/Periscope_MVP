class SessionsController < ApplicationController
  def new
  end
  
  def create
    @Provider = Provider.find_by({ "email" => params["email"] })
    if @Provider != nil
      if BCrypt::Password.new(@Provider["password"]) == params["password"]
        session["provider_id"] = @Provider["id"]
        flash["notice"] = "Login successful."
        redirect_to "/dashboard"
      else
        flash["notice"] = "Login unsuccessful."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Login unsuccessful."
      redirect_to "/login"
    end
  end

  def destroy
    session["provider_id"] = nil
    flash["notice"] = "Goodbye, see you next time."
    redirect_to "/"
  end
end

