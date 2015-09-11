module AuthHelpers

  def encode_credentials(username, password)
    ActionController::HttpAuthentication::Basic.encode_credentials(username, password)
  end

  def authenticate(user)
    allow_any_instance_of(BasicAuthentication).to receive(:authenticate).and_return(user)
  end

end
