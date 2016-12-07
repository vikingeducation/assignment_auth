class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


#HTTP Basic Authentication

  # http_basic_authenticate_with :name => "foo",
  #                              :password => "bar",
  #                              :except => [:index, :show]


#HTTP Digest Authentication
  # USERS = { 'foo' => 'bar' }
  #
  # before_action :authenticate, :except => [:index, :show]
  #
  # def authenticate
  #   authenticate_or_request_with_http_digest do |user|
  #   end
  #   USERS[user]
  # end


#Session Based Authentication
  private

    def sign_in(user)
      session[:user_id] = user.id
      @current_user = user
    end

    def sign_out
      @current_user = nil
      session.delete(:user_id)
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  #used in view
  def signed_in_user?
    !!current_user
  end

  helper_method :signed_in_user?

end



#HTTP Digest Authentication HEADER
# Authorization: Digest username="foo", realm="Application", nonce="MTQ4MTEzMjM1NjpjZTU5MzE2ZDFjOTA1ZWJjNzAxODJhMGQ1NWM1YTM5MA==", uri="/users/new", algorithm=MD5, response="d49ac37610bf47c85e2c8dbc577c46db", opaque="cf65508a49eee05fcef0aefad1b70197", qop=auth, nc=00000002, cnonce="b7b181d03a5d627
