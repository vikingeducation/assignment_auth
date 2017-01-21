class ApplicationController < ActionController::Base
  # http_basic_authenticate_with name: 'foo',
  #                              password: 'bar',
  #                              except: [:index, :show]
  protect_from_forgery with: :exception

  USERS = { "foo" => 'bar' }
  before_action :authenticate, except: [:index, :show]

  private

  def authenticate
    authenticate_or_request_with_http_digest do |username|
      USERS[username]
    end
  end




end
