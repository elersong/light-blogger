class ArticlesController < ApplicationController
  include ArticlesHelper
  before_filter :require_login, only: [:new, :create, :edit, :update, :destroy]
  
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
   
    @comment = Comment.new
    @comment.article_id = @article.id
 
  end
  
  def new
    # Since there is no information being pulled FROM the model, this action doesn't need to make any
    # model calls. All information will be pulled from the browser and inserted into the database.
    # However, the form_for(model_name) needs a model_name as an instance variable, and if we don't
    # initialize that variable here, it will raise an error.
      @article = Article.new
  end
  
  def create
    # Rails seems to use the create() action instead of the new() action in order to insert data into the
    # database. We'll use the "fail" hack to see the exact structure of the params hash in order to build
    # the create method. Uncomment the following line to observe params[] structure.
    # fail
    
    # Now, we use the strong parameters helper method we wrote in articles_helper.rb to sanitize to
    # beef up security for data from form submission. 
    @article = Article.new(article_params)
    @article.author = current_user
    @article.save 
    
    flash.notice = "Article '#{@article.title}' was created."
    
    # Instead of creating a new view template, we'll simply redirect to the show page for this article 
    # after it has been successfully created. 
    redirect_to article_path(@article)
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    flash.notice = "Article '#{@article.title}' was deleted."
  end
  
  def edit
    # Obviously, the controller will need to know which article to include in the view, so we look it up
    # based on its :id and then save that object into an instance variable @article.
    @article = Article.find(params[:id])
  end
  
  def update
    # Think of this as very similar to the create() action, except we don't assign a new :id to an object. We
    # instead look up an old :id row and change the contents using the article_params() from the ArticlesHelper class.
    @article = Article.find(params[:id])
    unless @article.author
      @article.author = current_user
    end
    @article.update(article_params) # no need to .save() the changes
    
    # We also need to update the show.html.erb view to include the flash notification...
    # NO WE DON'T. Rookie mistake. Add it to the application layout so that it shows up sitewide.
    flash.notice = "Article '#{@article.title}' was updated."
    
    redirect_to article_path(@article)
  end
  
end
