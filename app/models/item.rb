class Item < ApplicationRecord
    validates :product_name, presence: true
    validates :image, presence: true
    validates :product_description, presence: true
    validates :category_id, presence: true
    validates :condition_id, presence: true
    validates :shipping_id, presence: true
    validates :prefecture_id, presence: true
    validates :duration_id, presence: true
    validates :price, presence: true,
               numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
    validates :price, numericality:{ with: /\A[0-9]+\z/, message: 'must be half-width numbers' }   
   

  belongs_to :user
  has_one_attached :image
  include ActiveHash::Associations
 

  def was_attached?
    self.image.attached?
  end
end
