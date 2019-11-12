class ScrapingController < ApplicationController
  require 'nokogiri'
  require 'open-uri'

  def index
    url = 'https://tenki.jp'
    doc = Nokogiri::HTML(open(url))
    doc.xpath('//a[@class="forecast-map-entry"]').each do |link|
      if link.content.include?('大阪') && link.inner_html.match(/alt=.*雨.*?"/)
        @content = link.content
      end
    end
  end

  def post
    message = {
      type: 'text',
      text: set_params[:text]
    }
    client = Line::Bot::Client.new { |config| 
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }
    User.all.each do |user| 
      response = client.push_message(user.token, message)
    end
    redirect_to scraping_url
  end

  def callback

  end

  private 
  def set_params
    params.require(:post).permit(:text)
  end
end
