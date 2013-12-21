class SongsController < ApplicationController

  def search
    # puts "HELLO"
    # p params[:post]
    @post_data = params[:post]
    # puts "POST DATA!!!"
    # p params
    # puts "END POST DATA!!!"
    @songs = []
    @res = rdio_search(params[:post][:song])[0..29]
    # puts res
    @res.each do |track|
      @song = Song.new(
        :short_url => track["embedUrl"],
        :title => track["name"],
        :artist => track["artist"],
        :album => track["album"],
        :year => 0
        )
      @songs << @song
    end

    render "rdio_search_results", :locals => { :post_data => params[:post] }
  end

  def search_for_use_by_comment
    # puts "HELLO"
    # p params[:post]
    @comment_data = params[:comment]

    # puts "COMMENT DATA!!!"
    # p params
    # puts "END COMMENT DATA!!!"

    # @post_id = params[:post_id]
    @songs = []
    #HERE
    @res = rdio_search(params[:comment][:song])[0..29]
    # puts res
    @res.each do |track|
      @song = Song.new(
        :short_url => track["embedUrl"],
        :title => track["name"],
        :artist => track["artist"],
        :album => track["album"],
        :year => 0
        )
      @songs << @song
    end

    # if @songs.empty?

    # else
      render "rdio_search_results_for_comments", :locals => { :comment_data => params[:comment], :post_id => params[:post_id] }
    # end
  end
end