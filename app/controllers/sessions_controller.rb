class SessionsController < ApplicationController

  # /auth/netatmo
  def create
    token = auth_hash[:credentials][:token]
    puts "#{token}".red
    user = User.find_or_create_by(netatmo_token: token)
    sign_in user
    url = URI.parse("https://api.netatmo.com/api/getstationsdata?access_token=#{token}")
    @request = Net::HTTP.get(url)
    puts "================================".blue
    puts "#{@request}".yellow
    puts "================================".blue
    #redirect_to '/'
  end
  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
