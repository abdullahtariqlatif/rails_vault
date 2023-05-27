class ArticlesController < ApplicationController
  # @variable_name are varibles that can be used in the views with the same name as the method.

  def index
    # Get all of the Article Records from the Table
    @articles = Article.all
  end

  def show
    # Get a particular Article record which has the id revieved in the
    # parameters that are sent.
    @article = Article.find(params[:id])
  end

  def new
    # Create an new instance on the Class Article
    # Validation would not be triggered if no params are provided
    @article = Article.new
    # This instance variable would be used in the form_with method
    # To create a form for the Article record
    # form_with model: @article, method: :post

    # or
    # you could leave this method empty and initialze the object
    # in the form function's model parameter, Like this:
    # form_with model: Article.new, method: :post

    # The first approch is better for keeping the code DRY,
    # Why?
    # Well, There would be comments for that in their respective files.
  end

  def create
    # This time validations will be trigger
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
