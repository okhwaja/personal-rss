class NyTimes
  include HTTParty

  base_uri 'nytimes.com'
  format :html

  def self.daily_briefing
    get('/pages/nytnow/nytnow-email/index.html').body
  end

end
