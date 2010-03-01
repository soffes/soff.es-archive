class AboutController < ApplicationController
  
  def index
    @albums = weekly_album_chart #CACHE["weekly_album_chart"] or weekly_album_chart
  end
  
  protected
  
  def weekly_album_chart
    
    require 'net/http'
    require 'rexml/document'
    
    albums = []
    top_albums_url = "http://ws.audioscrobbler.com/2.0/?method=user.getweeklyalbumchart&user=#{LAST_FM_USERNAME}&api_key=#{LAST_FM_API_KEY}"
    albums_xml = REXML::Document.new(Net::HTTP.get_response(URI.parse(top_albums_url)).body)
    albums_xml.elements.each('lfm/weeklyalbumchart/album') do |album|
      if albums.length < 4
        
        mbid = album.elements['mbid'].text
        image_url = nil
        
        if mbid
          album_art_url = "http://ws.audioscrobbler.com/2.0/?method=album.getinfo&api_key=#{LAST_FM_API_KEY}&mbid=#{mbid}"
          album_art_xml = REXML::Document.new(Net::HTTP.get_response(URI.parse(album_art_url)).body)
          image_url = album_art_xml.elements['lfm/album/image[@size="large"]'].text
        end
        
        Rails.logger.info album_art_url
        albums << {
          :name => album.elements['name'].text,
          :image_url => image_url,
          :artist_name => album.elements['artist'].text,
          :url => album.elements['url'].text
        }
      end
    end
    CACHE.set("weekly_album_chart", albums, 7.days)
    albums
  end
end
