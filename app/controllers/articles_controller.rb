class ArticlesController < ApplicationController

	http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]

	def index
		logger.debug "AC.index : #{params.inspect}"
		@articles = Article.all
	end

	def show
		logger.debug "AC.show : #{params.inspect}"
		article_id = params[:id]
		@article = Article.find(article_id)
	end

	def new
		#instantiating article here so it is available in view 'new_article.html.erb'
		@article = Article.new
	end

	def edit
		logger.debug "AC.edit : #{params.inspect}"
		@article = Article.find(params[:id])
	end

	def create
		#render plain: params[:article].inspec
		logger.debug "AC.create: #{params.inspect}"
		@article = Article.new(article_params)
		if @article.save
			redirect_to @article
		else
			render 'new'
		end

	end

	def update
		logger.debug "AC.update: #{params.inspect}"
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		logger.debug "AC.destroy: #{params.inspect}"
		@article = Article.find(params[:id])
		@article.destroy
		redirect_to articles_path
	end

	private
	 def article_params
		 params.require(:article).permit(:title, :text)
	 end
end
