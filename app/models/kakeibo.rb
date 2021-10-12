class Kakeibo < ApplicationRecord

  belongs_to :user
  has_many :gachakakeibos, dependent: :destroy
  has_many :otherkakeibos, dependent: :destroy


end
