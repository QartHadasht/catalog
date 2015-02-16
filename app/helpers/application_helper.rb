module ApplicationHelper
  def catalog_list
    @cats = Cat.preload(:cats)
  end
end
