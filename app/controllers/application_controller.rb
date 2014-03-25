class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  def redirect_to_param(token)
    unless token.blank?
      parsed_token = URI.parse(token)
      res = ""
      res << parsed_token.path
      unless parsed_token.query.blank?
        res << "?"
        res << parsed_token.query
      end
      return res
    end
  end

  def authenticate_admin
    authenticate_or_request_with_http_basic do |user, password|
      user == ENV["ADMIN_USER"] && password == ENV["ADMIN_PASS"]
    end
  end
end
