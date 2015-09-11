class BasicAuthentication

  def initialize(request)
    @request = request
  end

  def authenticate
    ActionController::HttpAuthentication::Basic.authenticate(@request) do |username, password| 
      User.find_by(username: username).try(:authenticate, password)
    end || guest_user
  end

  private

    def guest_user
      User.new
    end

end
