class CrunchbaseController < ApplicationController
  include CrunchbaseHelper
  def daily
    @info = daily_info
    render 'daily_rss'
  end
end
