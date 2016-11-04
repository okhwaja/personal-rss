module ApplicationHelper
  def feed_url
    File.join(ENV['FEED_URL'] || 'localhost:3000', request.path)
  end
end
