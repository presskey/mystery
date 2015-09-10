class ApplicationController < ActionController::Base

  attr_reader :current_user

  before_action :authenticate

  def authenticate
    @current_user = BasicAuthentication.new(request).authenticate
  end

end
