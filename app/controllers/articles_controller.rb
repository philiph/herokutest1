class ArticlesController < ApplicationController

  def index
    @time = Time.now
    @articles = Article.all
  end
  
  def show
    @article = Article.find_by_id(params[:id])
    unless @article
      redirect_to :action => :index
    end
  end

  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(params[:article])
    if @article.save
      redirect_to :action => :index
    else
      render :action => :new
    end
  end
  
  def edit
    @article = Article.find_by_id(params[:id])
    unless @article
      redirect_to :action => :index
    end
  end

  def update
    @article = Article.find_by_id(params[:id])
    @article.update_attributes(params[:article])
    if @article.save
      redirect_to :action => :index
    else
      render :action => :new
    end      
  end
  
  def destroy
    @article = Article.find_by_id(params[:id])
    if @article
      @article.destroy
    end
    redirect_to :action => :index
  end
  

end
