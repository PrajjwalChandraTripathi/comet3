# ActiveAdmin register block
ActiveAdmin.register HomepageItem do
  permit_params :title, :location, :image, :link
  filter :title
  form do |f|
    f.inputs "Homepage Item Details" do
      f.input :title, label: "Title"
      f.input :location, label: "Location"
      f.input :link, label: "Link"
      f.input :image, as: :file, label: "Image"
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :location
    column :link
    column "Image" do |item|
      if item.image.attached?
        image_tag(item.image.variant(resize_to_limit: [100, 100]))
      else
        "No Image"
      end
    end
    actions
  end
end
