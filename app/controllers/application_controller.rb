class ApplicationController < ActionController::Base
  before_action :basic_auth

  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    added_attrs = [:nickname, :first_name, :last_name, :last_name_kana, :first_name_kana, :birthday]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['BASIC_AUTH_USER2'] && password == ENV['BASIC_AUTH_PASSWORD2']
    end
  end
end
