class NyTimesController < ApplicationController
  include NyTimesHelper
  def daily_briefing
    email_html = Nokogiri::HTML(NyTimes.daily_briefing)
    page_url = email_html.at_css('a.large-headline').attributes['href'].value
    page_html = Nokogiri::HTML(HTTParty.get(page_url).body)

    byebug
    title = page_html.at_css("h1[itemprop='headline']")




    @info = {
      title: 
    }
  end
end
