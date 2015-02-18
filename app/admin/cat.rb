ActiveAdmin.register Cat do
  before_filter :only => [:index] do
    if params['q'].blank?
       params['q'] = {:cat_id_eq => 0}
    end
  end 




  config.sort_order = 'position_asc' # assumes you are using 'position' for your acts_as_list column
  config.paginate   = false # optional; drag-and-drop across pages is not supported

  sortable



  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :cat_id, :active, :fold, :position
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
      f.input :position
      f.input :active, :as => :boolean
    end

    f.actions
  end


  index do
    id_column
    sortable_handle_column if params[:order] == 'position_asc'
    column :position
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
