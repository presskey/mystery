class ApplicationController < ActionController::Base

  include Pundit

  attr_reader :current_user

  rescue_from(Pundit::NotAuthorizedError)         { head :forbidden }
  rescue_from(ActiveRecord::RecordNotFound)       { head :not_found }
  rescue_from(ActionController::ParameterMissing) { head :bad_request }

  before_action :authenticate
  after_action :verify_authorized, except: :index

  def authenticate
    @current_user = BasicAuthentication.new(request).authenticate
  end

end
