class ArticlesController < ApplicationController
    def index
    @article = Article.all
    end

    
    def show
       @article = Article.find(params[:id])
    end
    
    def new
    end
    
    def create
        @article = Article.new(articles_params)
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    private
        def articles_params
            params.require(:article).permit(:title, :text)
        end
        
end
