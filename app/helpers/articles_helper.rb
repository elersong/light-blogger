module ArticlesHelper
  
  # this allows parameters passed in from the form_for(@article) only if they are :title or :body fields.
  def article_params
    params.require(:article).permit(:title, :body)
  end
  
end
