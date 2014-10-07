class ArticlesController < ApplicationController
  
  def index
    # We're going to need the @articles var to hold an array of all articles because the index
    # page is simply a listing of all the instances of this class. In the view, we cycle through
    # this array and output the data to the screen.
    @articles = Article.all
  end
  
  def show
    # When the user clicks on the link for a specific article, the id field of that object is placed
    # into a route url, which means it can be accessed by the params method. We can use that to query
    # the Article table, and .find() the correct @article to be displayed by the view.
    @article = Article.find(params[:id])
  end
  
end
