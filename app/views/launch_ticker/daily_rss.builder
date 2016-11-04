xml.instruct!
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
 
  xml.channel do
    xml.title 'Launch Ticker Email Updates'
    xml.description 'Curated Top Stories in Tech'
    xml.link 'http://www.launchticker.com'
    xml.language 'en'
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => feed_url
 
    for item in @items
      xml.item do
        xml.title item[:title]
        xml.link item[:link]
        xml.description item[:description]
        xml.guid({"isPermaLink" => "false"}, item[:guid])
        xml.pubDate item[:pubDate]
      end
    end
  end
 
end
