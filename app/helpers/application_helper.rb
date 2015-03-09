module ApplicationHelper
  def catalog_list
    @cats = Cat.active.where(:cat_id => 0).order("position asc").preload(:cats)
  end

  def parents_list
    return Tovar.find(params[:id]).cat.parents.map(&:id) + [Tovar.find(params[:id]).cat.id] if params[:action] == 'tovar'
    return Cat.find(params[:id]).parents.map(&:id) + [Cat.find(params[:id]).id] if ['show'].include?params[:action]
    return []
  end

  def cache_key_for_cats
    count          = Cat.count
    max_updated_at = Cat.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "cats/all-#{count}-#{max_updated_at}"
  end  

  def title(ptitle)
    content_for :title, ptitle.to_s
  end

  def description(pdescription)
    content_for :description, pdescription.to_s
  end
end
