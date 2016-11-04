xml.instruct!
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
 
  xml.channel do
    xml.title 'Crunchbase Daily'
    xml.description 'Daily summary of Crunchbase news'
    xml.link 'http://www.crunchbase.com'
    xml.language 'en'
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => feed_url
 

    xml.item do
      xml.title @info[:title]
      xml.link @info[:link]
      xml.description @info[:description]
      xml.guid({"isPermaLink" => "false"}, @info[:guid])
      xml.pubDate @info[:pubDate]
    end
  end
 
end
