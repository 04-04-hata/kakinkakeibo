class Kakeibo < ApplicationRecord
  belongs_to :user
  has_many :gachakakeibos, dependent: :destroy
  has_many :otherkakeibos, dependent: :destroy

  validates :name, presence: true
  validates :is_kakeibo_status, inclusion: { in: [true, false] }
end
