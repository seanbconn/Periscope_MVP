class ProvidersController < ApplicationController
  def new
  end

  def index
    render 'index'
  end

  def create
    @provider = provider_id.new
    @provider["first_name"] = params["first_name"]
    @provider["last_name"] = params["last_name"]
    @provider["email"] = params["email"]
    @provider["NPI"] = params["NPI"]
    @provider["password"] = BCrypt::Password.create(params["password"])
    @provider.save
    flash[:notice] = "Thanks for signing up. Now login."
    redirect_to "/login"
  end
end

