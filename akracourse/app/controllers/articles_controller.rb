class ArticlesController < ApplicationController
    def index
    @article = Article.all
    end
    
    def show
        find_article
    end

    def new
        @article = Article.new
    end
    
    def edit
        find_article
    end
    
    def create
        @article = Article.new(articles_params)
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def update
        @article = Article.find(params[:id])
        
        if @article.update(articles_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
       @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to articles_path
    end
    
    
    private
        def articles_params
            params.require(:article).permit(:title, :text)
        end
        
        def find_article
            @article = Article.find(params[:id])
        end
        
end
