class PostsController < ApplicationController

  def new

  end

  def create
    # FAKING SONG CREATION FOR NOW, WILL DO REAL STUFF WHEN WE USE RDIO
    # SEE BELOW FOR POSSIBLE TEMPLATE OF REAL SONG CREATION

    # rdio_song = nil # Will be the song object from Rdio

    song_params = {
      :short_url => params[:song_embed_url],
      :title => params[:song_title],
      :artist => params[:song_artist],
      :album => params[:song_album]
    }

    @song = Song.create!(song_params)

    # params[:song_id]

    # @song = Song.create(
    #   :short_url => "http://www.google.com",
    #   :title => "Fake Song Title",
    #   )



    post_params = {
      :title => params[:post_title],
      :motivation => params[:post_motivation],
      :user_id => current_user.id,
      :song_id => @song.id
    }

    @post = Post.new(post_params)

    # self.current_user.posts << @post #UNCOMMENT THIS WHEN DOING REAL THING

    ## Handle creation of Song object, grabbing song data from search results
    ## from Rdio here. Then associate song with this post and save song.
    # @song = Song.new(params[:song]) # Example code, not necessarily correct

    # @post.song_id = 1 # Fake a song ID for now, EDIT THIS LATER!!!

    if @post.save
      # May need to save user and song here
      redirect_to post_path(@post)
    else
      puts "FAILED TO SAVE!!!" #Replace this and handle failed save here.
    end
  end

  def index

  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @song = @post.song
  end

  def edit

  end

  def update

  end

  def destroy

  end

  def refresh
    puts "refresh"
    @posts = Post.last(5).reverse
    if request.xhr?
      render :_latest_posts, :layout => nil
    end
  end

  def search # find posts
    @query = params[:post][:search]
    query_ar = "%#{@query}%"
    @posts = Post.where("title like ? or motivation like ?", query_ar, query_ar)
    render :results
  end

  def results
  end
end
