class ApplicationController < ActionController::Base

  include Pundit

  attr_reader :current_user

  before_action :authenticate
  after_action :verify_authorized, except: :index

  def authenticate
    @current_user = BasicAuthentication.new(request).authenticate
  end

end
