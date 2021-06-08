class Item < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :category_id
    validates :audio
    
  end

  belongs_to :user
  has_one_attached :image
end
