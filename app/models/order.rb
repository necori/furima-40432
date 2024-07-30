class Order < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one    :address
 
  validates :price, numericality: true, presence: true
  validates :token, presence: true
end