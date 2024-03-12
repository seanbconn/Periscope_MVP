class ApplicationController < ActionController::Base
  before_action :current_provider

  def current_provider
    @current_provider = Provider.find_by({ "id" => session["provider_id"] })
  end
end
