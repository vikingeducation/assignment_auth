class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # showing off the :except (you'd put this in an
  # individual controller in reality)
  before_action :authenticate_user, :except => [:new, :index]

  # For Digest Auth
  USERS = { "David" => "david_1", 
            "Moshe" => "moshe_1",
            "Shelley" => "shelley_1",
            "Howard" => "howard_1",
            "Matt" => "matt_1" }

  private

# The HTTP Digest version (better)
  def authenticate_user
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end

end

