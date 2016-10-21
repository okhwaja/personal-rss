module CrunchbaseHelper

  def daily_info
    daily_html = Crunchbase.daily
    return nil if daily_html == Crunchbase::Unavailable

    dom = Nokogiri::HTML(daily_html)

    published_html = dom.at_css("meta[property='article:published_time']")
    published_timestamp = published_html.attributes['content'].value
    published_date = Date.parse(published_timestamp)
    published_datetime = DateTime.parse(published_timestamp)

    {
      title: "Crunchbase Daily: #{published_date.strftime('%a, %b %d %Y')}",
      link: 'http://static.crunchbase.com/daily/content_share.html',
      description: 'Crunchbase Daily News',
      pubDate: published_datetime.to_s(:rfc822),
      guid: "crunchbase_daily_#{published_date}"
    }
  end

  def feed_url
    File.join('https://personal-rss.herokuapp.com', request.path)
  end
end
