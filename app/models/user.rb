class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :kakeibos, dependent: :destroy
  has_many :gacha_kaKakeibos, dependent: :destroy
  has_many :other_kakeibos, dependent: :destroy

end
