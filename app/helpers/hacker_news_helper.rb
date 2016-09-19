module HackerNewsHelper
  def feed_url
    File.join('https://personal-rss.herokuapp.com', request.path)
  end
end
