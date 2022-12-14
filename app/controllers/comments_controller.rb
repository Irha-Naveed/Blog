class CommentsController < ApplicationController
    https:basic_authenticate_with name: "irha", password: "123", expect: [:destroy]
    def new
        @comment=Comment.new
    end
    def create
        @article = Article.find(params[:article_id]);
        @comment = Comment.new(comment_params);
        @comment.article = @article
        if @comment.save()
            flash[:notice] = "Comment Added Successfully"
            redirect_to article_path(@article)
        end
        
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private
        def comment_params 
            params.require(:comment).permit(:commenter, :body, :status)
        end
end
