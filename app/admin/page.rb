ActiveAdmin.register Page do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :text, :location, :description, :keywords
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
      f.input :title
      f.input :text, :as => :ckeditor
      f.input :location
    end

    f.actions
  end

end
