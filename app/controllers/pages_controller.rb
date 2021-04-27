class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
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
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])

    # require only the page parameter, permit only the three page parameters
    # page_params = params.require(:page).permit(:title, :body, :slug)

    # pass the filtered page_params to the Page Object loaded in
    @page.update(page_params)
    # tell browser to load the view for the updated page once it's saved
    redirect_to @page
  end

  private
    # require only the page parameter, permit only the three page parameters
    def page_params
      params.require(:page).permit(:title, :body, :slug)
    end
end
