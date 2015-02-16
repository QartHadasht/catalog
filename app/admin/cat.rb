ActiveAdmin.register Cat do
  before_filter :only => [:index] do
    if params['q'].blank?
       params['q'] = {:cat_id_eq => 0}
    end
  end


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form do |f|
    f.inputs "Категория" do
      f.input :cat_id, :as => :select, :collection => Cat.all.collect {|cat| [cat.name, cat.id] }.prepend(['', 0]), :include_blank => false
      f.input :name
    end

    f.actions
  end


  index do
    id_column
    column :Название do |cat|
      if cat.cats.present?
        link_to cat.name, :controller => "cats", :action => "index", 'q[cat_id_eq]' => "#{cat.id}".html_safe
      else
        cat.name
      end
    end
    actions
  end


end
