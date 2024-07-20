class Price
  validates :price, nemericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :price, format: { with: /\A[0-9]+\z/}.freeze
  validates :product_description, presence:true
  validates :category_id, presence:true
end

has_one :order
belongs_to :user
has_one_attached :image

end