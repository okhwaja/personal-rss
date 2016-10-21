class LaunchTicker
  class Unavailable; end

  include HTTParty
  base_uri 'launchticker.com'
  format :html

  # get the archive for the date
  # either morning or either version
  def self.archive_link(date:, evening: false)
    path = "/archive/#{date.strftime('%Y-%m-%d')}#{'_1' if evening}"
    res = head(path)

    if res.code == 200
      File.join('https://www.launchticker.com', path)
    else
      Unavailable
    end
  end
end
