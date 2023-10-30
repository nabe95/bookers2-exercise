class BookCommentsController < ApplicationController
    def create
        book = Book.find(params[:book_id])
        @comment = current_user.book_comments.new(book_comments_params)
        @comment.book_id = book.id
        @comment.save
    end
    
    def destroy
        @comment = BookComment.find(params[:id])
        @comment.destroy
    end
    
private
    def book_comments_params
        params.require(:book_comment).permit(:comment)
    end
end
