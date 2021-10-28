class GachaKakeibo < ApplicationRecord
  belongs_to :user
  belongs_to :kakeibo

  validates :object, presence: true
  validates :billing_amount, presence: true
  validates :single_gacha, presence: true
  validates :ten_combo_gacha, presence: true
  validates :total, presence: true
  validates :is_result_status, inclusion: { in: [true, false] }
  validates :winning_count, presence: true
  validates :billing_item, presence: true
end
