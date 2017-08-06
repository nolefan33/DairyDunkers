class Cookie < ApplicationRecord
    validates :photo, presence: true
    validates :title, presence: true
    validates :description, presence: true
    
    has_attached_file :photo
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
end
