module ApplicationHelper
  def catalog_list
    @cats = Cat.active.where(:cat_id => 0).order("position asc").preload(:cats)
  end

  def parents_list
    return Tovar.find(params[:id]).cat.parents.map(&:id) + [Tovar.find(params[:id]).cat.id] if params[:action] == 'tovar'
    return Cat.find(params[:id]).parents.map(&:id) + [Cat.find(params[:id]).id] if ['show'].include?params[:action]
    return []
  end
end
