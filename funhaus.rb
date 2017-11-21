require 'open-uri'
require 'nokogiri'

class Funhaus

  FEED_URL = "http://funhaus.roosterteeth.com/show/dude-soup/feed/mp3"

  attr_accessor :xml

  def self.run(*args)
    self.new(*args).call
  end

  def call
    download_xml
    fetch_mp3_urls
  end

  def download_xml
    @xml = open(FEED_URL).read
  end

  def fetch_mp3_urls
    xml_file.xpath('//item//enclosure').each do |link|
      url = link.attribute("url").to_s

      file_name = parse_name url

      next if already_downloaded.include? "funhaus-podcasts/#{file_name}"

      puts "We are downloading #{file_name}"

      download_file(url, "funhaus-podcasts/#{file_name}")
    end
  end

  protected

  def xml_file
    @xml_file ||= Nokogiri::XML(xml)
  end

  def parse_name(link)
    link.split("/").last
  end

  def download_file(link, destination)
    File.write(destination, open(link).read)
  end

  def already_downloaded
    @downloaded ||= Dir["funhaus-podcasts/*.mp3"]
  end

end

Funhaus.run

