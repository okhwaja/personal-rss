xml.instruct!
xml.rss :version => '2.0' do
 
  xml.channel do
    xml.title 'HN Popular Stories'
    xml.description 'Popular stories from HN from the last 24 hours that meet the score threshold'
    xml.link 'http://www.google.com'
    xml.language 'en'
 
    for item in @items
      xml.item do
        xml.title item[:title]
        xml.link item[:link]
        xml.comments item[:comments]
        xml.guid({"isPermaLink" => "false"}, item[:guid])
        xml.pubDate item[:pubDate]
      end
    end
 
  end
 
end
