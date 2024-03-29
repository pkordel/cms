class ArticlesController < ApplicationController
  before_action :set_article_type
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.published
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @title = "New #{@type} article"
    @article = klass.new
  end

  # GET /articles/1/edit
  def edit
    @title = "Edit #{@type} article"
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = klass.new(article_params)

    respond_to do |format|
      success = if params[:save_as_draft].present?
        @article.save_as_draft
        notice = 'Draft was successfully created.'
      else
        if can? :publish, Article
          @article.publish
          notice = 'Article was successfully published.'
        else
          @article.submit
          notice = 'Article was successfully submitted.'
        end
      end
      if success
        format.html { redirect_to articles_url, notice: notice }
        format.json { render action: 'show', status: :created, location: @article }
      else
        format.html { render action: 'new' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        @article.save_as_draft if params[:save_as_draft].present?
        format.html { redirect_to articles_url, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  private

    def set_article_type
      @type = if (article_type = params[:type]) && ARTICLE_TYPES.include?(article_type)
        article_type
      else
        'general'
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      permitted_params = [:title, :content, :taxonomy_id]
      permitted_params += klass.hstore_keys

      article_param = klass.model_name.param_key

      params.require(article_param).
             permit(permitted_params).merge(creator: current_user)
    end

    def klass
      @type  ||= 'general'
      @klass ||= "article/#{@type}".camelize.constantize
    end
end
