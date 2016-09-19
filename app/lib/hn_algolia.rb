class HnAlgolia
  include HTTParty

  base_uri 'hn.algolia.com/api/v1/search_by_date'
  format :json

  debug_output

  def self.popular_daily_stories
    query = {
      tags: 'story',
      page: 0,
      numericFilters: [
        "created_at_i > #{(Time.now - 24.hours).to_i}",
        "points > 100"
      ].join(',')
    }
    get('/', query: query)
  end

  def self.popular_show_hns
    query = {
      tags: 'show_hn',
      page: 0,
      numericFilters: [
        "created_at_i > #{(Time.now - 24.hours).to_i}",
        "points > 25"
      ].join(',')
    }
    get('/', query: query)
  end
end
