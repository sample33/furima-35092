class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, :birthday
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+{6}\z/}
    validates :family_name, :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
    validates :family_name_kana, :first_name_kana, format: {with: /\A[ァ-ヶー]+\z/}
  end

  has_many :items
  has_many :orders
end
