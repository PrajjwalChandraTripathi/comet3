class HomepageItem < ApplicationRecord
    def self.ransackable_attributes(auth_object = nil)
        ["created_at", "location", "id", "link", "id_value", "image_url", "title", "updated_at"]
    end

    def self.ransackable_associations(auth_object = nil)
        ["image_attachment", "image_blob"]
    end

    has_one_attached :image
end
