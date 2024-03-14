class ProvidersController < ApplicationController
  def new
  end

  def create
    if Provider.find_by({ "email" => params["email"] }) == nil
     @provider = Provider.new
     @provider["first_name"] = params["first_name"]
     @provider["last_name"] = params["last_name"]
     @provider["email"] = params["email"]
     @provider["NPI"] = params["NPI"]
     @provider["password"] = BCrypt::Password.create(params["password"])
     @provider.save
     redirect_to "/login"
     flash[:notice] = "Thanks for signing up. Now, login."
    else
      flash["notice"] = "Email taken."
      redirect_to "/providers/new"

  end
end
