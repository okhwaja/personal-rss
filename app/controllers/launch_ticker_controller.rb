class LaunchTickerController < ApplicationController
  include LaunchTickerHelper
  def daily
    @items = daily_ticker
    render 'daily_rss'
  end
end
