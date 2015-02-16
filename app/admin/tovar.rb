ActiveAdmin.register Tovar do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :description, :price, :art, :cat_id, :pics_attributes => [:id, :image, :_destroy]
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    id_column
    column :name
    column :art
    column :price
    column :Раздел do |tovar|
      if tovar.cat.present?
        tovar.cat.name
      end
    end
    actions
  end  

  form html: {multipart: true} do |f|
    f.inputs "Изделие" do
      f.input :cat_id, :as => :select, :collection => Cat.all.collect {|cat| [cat.name, cat.id] }.prepend(['', 0]), :include_blank => false
      f.input :name
      f.input :art
      f.input :price
    end
    f.inputs do
      f.has_many :pics, allow_destroy: true do |pf|
        pf.input :image, :as => :file, :hint => pf.object.image? ? pf.template.image_tag(pf.object.image.url) : pf.template.content_tag(:span, "Ещё нет изображения")
      end
    end

    f.actions
  end


end
