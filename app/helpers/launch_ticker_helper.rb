module LaunchTickerHelper

  def daily_ticker(date: Date.today)
    res = []
    morning_version = LaunchTicker.archive_link(date: date, evening: false)
    evening_version = LaunchTicker.archive_link(date: date, evening: true)

    unless morning_version == LaunchTicker::Unavailable
      res << {
        title: "#{date.strftime('%a, %m %b %Y')}: Morning Edition",
        description: 'Daily Startup News by LaunchTicker',
        link: morning_version,
        pubDate: (date + 9.hours - Time.zone_offset('PST')).to_s(:rfc822), # 9am pacific
        guid: "launch_ticker_#{date}_0"
      }
    end

    unless evening_version == LaunchTicker::Unavailable
      res << {
        title: "#{date.strftime('%a, %m %b %Y')}: Evening Edition",
        description: 'Daily Startup News by LaunchTicker',
        link: evening_version,
        pubDate: (date + 17.hours - Time.zone_offset('PST')).to_s(:rfc822), # 5pm pacific
        guid: "launch_ticker_#{date}_1"
      }
    end

    res
  end

  def feed_url
    File.join('https://personal-rss.herokuapp.com', request.path)
  end
end
