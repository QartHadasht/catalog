class PagesController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout "application"
  add_breadcrumb "izmedi.ru", :root_path



  def show
    @page = params[:id]
    @page = Page.where(:location => params[:id]).first or raise ActionController::RoutingError.new('Not Found')
    add_breadcrumb @page.title
  end
end
