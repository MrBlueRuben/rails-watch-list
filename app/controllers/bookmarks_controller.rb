class BookmarksController < ApplicationController

  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list

    if @list.save
      redirect_to list_path(@list)
    else
        #raise
        render 'gardens/show', status: :unprocessable_entity
    end
  end
  private

  def bookmarks_params
    raise
    params.require(:bookmark).permit(:commet)
  end
end
