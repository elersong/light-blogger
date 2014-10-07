class CommentsController < ApplicationController
  
  def create
    @comment = Comment.new(comment_params)
    
    # We don't want the form to be able to set the relationship foreign key for the comment. Do that by hand. Then save.
    @comment.article_id = params[:article_id]
    @comment.save
    
    # Give feedback that the action has been successful
    flash.notice = "Your comment was posted."
    
    # Now show the article again... refreshed with the new comment. 
    redirect_to article_path(@comment.article)
  end
  
  def comment_params
    # The only things that should come from the form_for(@comment) are the author name and body.
    params.require(:comment).permit(:author_name, :body)
  end
  
end
