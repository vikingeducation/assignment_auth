class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception







#HTTP Basic Authentication

  # http_basic_authenticate_with :name => "foo",
  #                              :password => "bar",
  #                              :except => [:index, :show]

# HTTP Digest Authentication
#   USERS = { 'foo' => 'bar' }

#   before_action :authenticate, :except => [:index, :show]

#   def authenticate
#     authenticate_or_request_with_http_digest do |user|
#     end
#     USERS[user]
#   end

end

# HTTP Digest Authentication HEADER
# Authorization: Digest username="foo", realm="Application", nonce="MTQ4MTEzMjM1NjpjZTU5MzE2ZDFjOTA1ZWJjNzAxODJhMGQ1NWM1YTM5MA==", uri="/users/new", algorithm=MD5, response="d49ac37610bf47c85e2c8dbc577c46db", opaque="cf65508a49eee05fcef0aefad1b70197", qop=auth, nc=00000002, cnonce="b7b181d03a5d627
