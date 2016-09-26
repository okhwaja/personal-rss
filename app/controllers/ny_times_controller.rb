class NyTimesController < ApplicationController
  include NyTimesHelper
  def daily_briefing
    @info = daily_briefing_info
    render 'ny_daily_rss'
  end
end
