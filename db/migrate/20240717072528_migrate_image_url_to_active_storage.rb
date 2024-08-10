class MigrateImageUrlToActiveStorage < ActiveRecord::Migration[7.1]
  def up
    HomepageItem.find_each do |item|
      next unless item.image_url.attached?

      # Assuming image_url is a URL, you need to download and attach it to Active Storage
      # Example:
      # file = URI.open(item.image_url)
      # item.image.attach(io: file, filename: File.basename(file.path))

      # If image_url is a local file path, you can directly attach it
      # Example:
      # item.image.attach(io: File.open(item.image_url), filename: File.basename(item.image_url))

      # Replace above with appropriate method based on how image_url is stored
    end

    remove_column :homepage_items, :image_url
  end

  def down
    add_column :homepage_items, :image_url, :string

    HomepageItem.find_each do |item|
      next unless item.image.attached?

      # Depending on your need, you might want to store image URL back to image_url column
      # Example:
      # item.update(image_url: rails_blob_url(item.image))
    end
  end
end
