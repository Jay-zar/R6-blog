class PagesController < ApplicationController
    before_action :set_page, only: [:show, :edit, :update, :destroy]
    def index 
        @pages = Page.all
    end

    def show
    end

    def new 
        @page = Page.new
    end

    #Making a new page
    def create
        @page = Page.new(page_params)
        @page.save
        redirect_to @page
    end
    #Edit existing page
    def edit
    end
    #Send patch request for page that was edited 
    def update 
        @page.update(page_params)
        redirect_to @page
    end

    def destroy
        @page.destroy
        redirect_to pages_path
    end

    private  
    
    #Method for standard param requirements in page creation and updates
        def page_params
            params.require(:page).permit(:title, :body, :slug)
        end
    #Method to find a specific page from params
    def set_page
        @page = Page.find(params[:id])
    end
end
