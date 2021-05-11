class PagesController < ApplicationController
  # before_action method, at the top of controller class and outside any instance methods:
  # the controller will call set_page method before running any action method
  # before_action :set_page, except: [:index, :new, :create]
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  def index
    @pages = Page.all
  end

  def show
    # look up page using the id parameter of Page Object and
    # assign it to page instance variable
    # set_page

    # render text: params[:id]
    # render text: @page.title  (Rails can only render one thing per controller)
  end

  def new
    @page = Page.new
  end

  def create
    # @page = Page.new(params) (doesn't specify which params are allowed for use)
    # render text: params.to_json (just to see the object notation)

    # require only the page parameter, permit only the three page parameters
    # page_params = params.require(:page).permit(:title, :body, :slug)

    # set instance var @page to the new Page Object with the filtered page_params
    @page = Page.new(page_params)
    # save the Page record
    @page.save
    # tell browser to load the view for the new page once it's saved
    redirect_to @page
  end

  def edit
    # look up page using the id parameter of Page Object and
    # assign it to page instance variable
    # set_page
  end

  def update
    # look up page using the id parameter of Page Object and
    # assign it to page instance variable
    # set_page

    # require only the page parameter, permit only the three page parameters
    # page_params = params.require(:page).permit(:title, :body, :slug)

    # pass the filtered page_params to the Page Object loaded in
    @page.update(page_params)
    # tell browser to load the view for the updated page once it's saved
    redirect_to @page
  end

  def destroy
    # look up page to destroy using the id parameter of Page Object and
    # assign it to page instance variable
    # set_page
    
    # call detroy method to delete record from database
    @page.destroy
    # tell browser to load the view for the pages
    redirect_to pages_path
  end

  private
    # require only the page parameter, permit only the three page parameters
    def page_params
      params.require(:page).permit(:title, :body, :slug)
    end

    # look up page using the id parameter of Page Object and
    # assign it to page instance variable
    def set_page
      @page = Page.find(params[:id])
    end
end
