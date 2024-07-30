class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :duration
  
  validates :image,         presence: true
  validates :product_name,  presence: true, length: { maximum: 40 }
  validates :product_description,   presence: true, length: { maximum: 1000 }
  validates :category_id,   numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :duration_id,        numericality: { other_than: 1, message: "can't be blank" }
 
  
  with_options presence: true, format: { with: /\d/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                      presence: { message: "can't be blank" }

       
  end 
end