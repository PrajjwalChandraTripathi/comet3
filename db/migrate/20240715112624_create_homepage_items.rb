class CreateHomepageItems < ActiveRecord::Migration[7.1]
  def change
    create_table :homepage_items do |t|
      t.string :image_url
      t.string :title
      t.string :link
      t.text :location

      t.timestamps
    end
  end
end
