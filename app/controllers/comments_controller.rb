class CommentsController < ApplicationController
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

    private
        def comment_params 
            params.require(:comment).permit(:commenter, :body)
        end
end
