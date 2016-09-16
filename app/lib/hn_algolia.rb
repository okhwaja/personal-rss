class HnAlgolia
  include HTTParty

  base_uri 'hn.algolia.com/api/v1/search_by_date'
  format :json

  debug_output

  def self.top_stories_of_day(options={})
    query = options.empty? ? default_query : options
    byebug
    get('/', query: query)
    # get('/')
  end

  def self.default_query
    {
      tags: 'story',
      page: 0
    }
  end
end
