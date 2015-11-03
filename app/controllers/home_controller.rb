class HomeController < ApplicationController
  def index
    request_token_url = URI.parse("https://api.netatmo.net/oauth2/token")
    authorize_url = URI.parse("https://api.netatmo.net/oauth2/authorize")
    request = Net::HTTP.get(request_token_url)
    authorize_request = Net::HTTP.get(authorize_url)
    puts "#{request}".yellow
    puts "#{authorize_request}".green
  end

  def request_netatmo
    if user_signed_in?
      url = URI.parse("https://api.netatmo.com/api/getstationsdata?access_token=#{current_user.netatmo_token}")
      @request = Net::HTTP.get(url)
      puts "================================".blue
      puts "#{@request}".yellow
      puts "================================".blue
    else

    end
  end
end
