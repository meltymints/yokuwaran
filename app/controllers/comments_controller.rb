class CommentsController < ApplicationController

		def index
	  		@comments = Comment.all
		end


		def show
			@comment = Comment.find(params[:id])
			@comment = Comment.new
			@comment.article_id = @article.id
		end

		def new
			@article = Article.new

		end

		def create
  			@comment = Comment.new(comment_params)
  			@comment.article_id = params[:article_id]

  			@comment.save

  			redirect_to article_path(@comment.article)
		end

		def comment_params
  			params.require(:comment).permit(:author_name, :body)
		end

		def update
  			@comment = Comment.find(params[:id])
  			@comment.update(comment_params)



  			redirect_to articles_path(@comment.article)
		end

		def edit
  			@comment = Comment.find(params[:id])
		end


		def destroy
			@comment = Comment.find(params[:id])
			@comment.destroy


			redirect_to articles_path
		end



	end

