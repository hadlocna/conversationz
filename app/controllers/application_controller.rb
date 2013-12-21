class ApplicationController < ActionController::Base
  protect_from_forgery

  include ControllerHelper

  def index
  end

  #FAKE FOR NOW
  # def get_song_from_rdio(search_term)
  #   @song = Song.new(
  #       :title => "This is a faked song",
  #       :short_url => "http://www.google.com",
  #       :artist => "Faked artist",
  #       :album => "Faked Album",
  #       :year => 1000
  #     )
  # end

  def rdio_client
    client ||= OAuth::Consumer.new(
        ENV["RDIO_CONSUMER_KEY"],
        ENV["RDIO_CONSUMER_SECRET"],
        :site => "http://api.rdio.com",
        :scheme => :header
      )
  end

  def rdio_search(search_term)
    search_results_json = rdio_client.request(
        :post,
        '/1/search',
        nil,
        {},
        "method=search&query=#{search_term}&types=Track",
        {
          'Content-Type' => 'application/x-www-form-urlencoded'
      })

    search_results = JSON.parse(search_results_json.body)["result"]["results"]

    search_results
  end
end
