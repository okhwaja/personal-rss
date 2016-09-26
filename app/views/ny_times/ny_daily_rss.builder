xml.instruct!
xml.rss :version => '2.0', 'xmlns:atom' => 'http://www.w3.org/2005/Atom' do
 
  xml.channel do
    xml.title 'NYT Morning Briefings'
    xml.description 'Brief summary of the daily news stories from the NY times'
    xml.link 'http://www.google.com'
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
