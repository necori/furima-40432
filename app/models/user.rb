class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  #has_many :orders

  validates :nickname, presence:true
    
  VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'should include both letters and numbers' }
  validates :last_name, presence:true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze }
  validates :first_name, presence:true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/.freeze }
  validates :read_last, format: { with: /\A[ァ-ヶー－]+\z/.freeze }
  validates :read_first, format: { with: /\A[ァ-ヶー－]+\z/.freeze }
  validates :birth_day, presence:true

end