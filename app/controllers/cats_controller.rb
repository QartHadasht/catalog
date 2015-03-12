class CatsController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  layout "application"
  add_breadcrumb "izmedi.ru", :root_path




  def index
    #@cats = Cat.root
    page = Page.where(:location => 'index').first
    @text = page.text if page.present?
  end

  def show
    @cat = Cat.find(params[:id])
    @tovars = Tovar.where(:cat_id => @cat.children).preload(:pics)
    @cat.parents.each do |one|
      add_breadcrumb one.name, cat_path(one)
    end
    add_breadcrumb @cat.name
  end

  def tovar
    @tovar = Tovar.find(params[:id])
    cat = @tovar.cat
    cat.parents.append(cat).each do |one|
      add_breadcrumb one.name, cat_path(one)
    end
    add_breadcrumb @tovar.name
  end

end
