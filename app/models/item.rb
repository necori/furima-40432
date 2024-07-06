class Item < ApplicationRecord
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :item_status_id
  end
  has_one : order
  belongs_to : user
  has_one_attached :image
end
