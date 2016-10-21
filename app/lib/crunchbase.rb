class Crunchbase
  class Unavailable; end

  include HTTParty

  base_uri 'static.crunchbase.com'
  format :html

  def self.daily
    res = get('/daily/content_share.html')
    res.code == 200 ? res : Unavailable
  end
end
