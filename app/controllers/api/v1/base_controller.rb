class Api::V1::BaseController < ApplicationController

  protect_from_forgery with: :null_session

  before_action :authenticate

  private
  
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      token == YAML.load_file('config/secrets.yml')[Rails.env]["secret_key_base"]
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: 'Bad credentials', status: 401
  end
  
end