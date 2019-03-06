class SingsController < ApplicationController
  
  def index
    @sings = Sing.where(song_id: params[:song_id])
  end

  def new
    @sing = Sing.new(song_id: params[:song_id])
  end

  def show
    @sing = Sing.find(params[:id])
  end

  def create
    @sing = Sing.new(sing_param.merge(song_id: params[:song_id]))
    if @sing.save
      redirect_to @sing.song
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
    @sing = Sing.find(params[:id])
    @sing.destroy

    redirect_to @sing.song
  end

  private

    def sing_param
      params.require(:sing).permit(:url, :song_id)
    end
end
