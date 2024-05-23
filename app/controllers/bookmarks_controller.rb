class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new # Needed to instantiate the form_with
  end

  def create
    @bookmark = Bookmark.new(bookmarks_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
