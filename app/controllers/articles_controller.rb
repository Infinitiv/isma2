class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy, :current_user_owner?]
  before_action :set_comments, only: [:show, :edit, :update]
  before_action :set_attachments, only: [:show, :edit, :update, :minify_img]
  before_action :current_user_administrator?, only: [:index, :destroy]
  before_action :current_user_moderator? || :current_user_owner?, only: [:new, :edit, :create, :destroy]
  
  def index
    @articles = Article.all.order("updated_at DESC")
    if current_user.nil?
      @last_news_articles = @articles.where("article_type_id = ? and (exp_date >= ? or exp_date IS ?) and published = ?", 2, Time.now.to_date, nil, true).where(group_id: [nil]).limit(5)
      @anounces_articles = @articles.where("article_type_id = ? and exp_date >= ? and published = ?", 3, Time.now.to_date, true).where(group_id: [nil]).limit(5)
      @articles = @articles.where("article_type_id = ? and (exp_date >= ? or exp_date IS ?) and published = ?", 1, Time.now.to_date, nil, true).where(group_id: [nil]).limit(10)
      @personal_articles = @articles.where("(exp_date >= ? or exp_date IS ?) and published = ?", Time.now.to_date, nil, true).where(group_id: [:nil]).limit(10)    
    else
      @last_news_articles = @articles.where("article_type_id = ? and (exp_date >= ? or exp_date IS ?) and published = ?", 2, Time.now.to_date, nil, true).where(group_id: current_user.groups + current_user.groups.map {|g| g.parent}.select {|g| !g.nil?}.uniq  + [nil]).limit(5)
      @anounces_articles = @articles.where("article_type_id = ? and exp_date >= ? and published = ?", 3, Time.now.to_date, true).where(group_id: current_user.groups + current_user.groups.map {|g| g.parent}.select {|g| !g.nil?}.uniq  + [nil]).limit(5)
      @articles = @articles.where("article_type_id = ? and (exp_date >= ? or exp_date IS ?) and published = ?", 1, Time.now.to_date, nil, true).where(group_id: current_user.groups + current_user.groups.map {|g| g.parent}.select {|g| !g.nil?}.uniq  + [nil]).limit(10)
      @personal_articles = @articles.where("(exp_date >= ? or exp_date IS ?) and published = ?", Time.now.to_date, nil, true).where(group_id: current_user.groups + current_user.groups.map {|g| g.parent}.select {|g| !g.nil?}.uniq).limit(10)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.atom {render atom: @last_news_articles}
    end
  end
  
  def show
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render action: 'new'
    end
  end
  
  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @article.destroy
    
    redirect_to articles_url
  end
  
  def feed
    @articles = Article.order("updated_at DESC").where("article_type_id = ? and updated_at > ? and published = ?", 2, Time.now.to_date - 30, true)
    
    respond_to do |format|
      format.atom
    end
  end
  
  private
  def set_article
    @article = Article.find(params[:id])
  end

  def set_comments
    @comments = @article.comments
  end
  
  def set_attachments
    @attachments = @article.attachments
  end
  
  def article_params
    params.require(:article).permit(:id, :user_id, :title, :content, :exp_date, :published, :fixed, :commentable, :division_id, :group_id, :article_type_id)
  end
  
  
  def current_user_owner?
    @article.user == current_user
  end
end
