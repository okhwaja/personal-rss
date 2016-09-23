module NyTimesHelper
  def daily_briefing_info
    email_html = Nokogiri::HTML(NyTimes.daily_briefing)
    page_url = email_html.at_css('a.large-headline').attributes['href'].value
    page_html = Nokogiri::HTML(HTTParty.get(page_url).body)

    byebug
    title = page_html.at_css("h1[itemprop='headline']")
    title_text = title.children.first.text

    date = page_html.at_css("time[itemprop='dateModified']")
    dateModified = date.attributes['datetime'].text

    description = page_html
      .at_css("meta[itemprop='description']")
      .attributes['content'].text

    title = page_html
      .at_css("meta[itemprop='description']")
      .attributes['content'].text

    {
      title: title_text,
      description: description,
      author: 
      pubDate: DateTime.parse(dateModified).to_s(:rfc822)
    }
  end
end
