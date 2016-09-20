class HackerNewsController < ApplicationController
  def hn_popular_stories
    hn_data = HnAlgolia.popular_daily_stories['hits']
    @items = hn_data.map { |x| hn_item_to_rss_entry(x) }
    render 'hn_rss'
  end

  def hn_popular_show
    hn_data = HnAlgolia.popular_show_hns['hits']
    @items = hn_data.map { |x| hn_item_to_rss_entry(x) }
    render 'hn_rss'
  end

  def hn_item_to_rss_entry(item)
    ch = comment_html(item)
    {
      title: item['title'],
      link: item['url'],
      author: item['author'],
      comments: ch,
      guid: "#{item['objectID']}_#{item['author']}",
      pubDate: DateTime.parse(item['created_at']).to_s(:rfc822)
    }
  end

  def comment_html(item)
    "<p>#{item['points']} points</p>" + 
      "<a href='https://news.ycombinator.com/item?id=#{item['objectID']}'>#{item['num_comments']} comments</a>"
  end
end
