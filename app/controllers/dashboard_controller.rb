class DashboardController < ApplicationController
  before_action :require_login

  def show
    @provider = Provider.find(session[:provider_id])
  end

  private

  def require_login
    unless session[:provider_id]
      flash[:error] = "You must be logged in to access this page"
      redirect_to login_path
    end
  end
end
