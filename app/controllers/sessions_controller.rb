class SessionsController < ApplicationController
  def new
  end
  
  def create
    @Provider = Provider.find_by({ "email" => params["email"] })
    if @Provider != nil
      if BCrypt::Password.new(@provider["password"]) == params["password"]
        session["provider_id"] = @provider["id"]
        flash["notice"] = "Hello and welcome to Periscope!"
        redirect_to "/"
      else
        flash["notice"] = "Login Incorrect."
        redirect_to "/login"
      end
    else
      flash["notice"] = "Login Incorrect."
      redirect_to "/login"
    end
  end

  def destroy
    session["provider_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end

