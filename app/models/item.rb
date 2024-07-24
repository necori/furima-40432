class Item < ApplicationRecord
    validates :product_name, presence: true
    validates :image, presence: true
    validates :product_description, presence: true
    validates :category_id, presence: true, numericality: { other_than: 1 }
    validates :condition_id, presence: true, numericality: { other_than: 1 }
    validates :shipping_id, presence: true, numericality: { other_than: 1 }
    validates :prefecture_id, presence: true, numericality: { other_than: 1 }
    validates :duration_id, presence: true, numericality: { other_than: 1 }
    validates :price, presence: true
    validates :price, numericality: { only_integer: true, message: ' Half-width number'}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is out of setting range"}
 
  
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :duration
 
  validates :content, presence: true, unless: :was_attached?
  
  def was_attached?
    self.image.attached?
  end
end
