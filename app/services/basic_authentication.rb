class BasicAuthentication

  def initialize(request)
    @request = request
  end

  def authenticate
    ActionController::HttpAuthentication::Basic.authenticate(@request) do |username, password| 
      find_user(username, password)
    end || guest_user
  end

  private

    def find_user(username, password)
      User.find_by(username: username, password: password)
    end

    def guest_user
      User.new
    end

end
