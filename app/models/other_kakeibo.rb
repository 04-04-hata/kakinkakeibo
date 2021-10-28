class OtherKakeibo < ApplicationRecord
  belongs_to :user
  belongs_to :kakeibo

  validates :object, presence: true
  validates :billing_amount, presence: true
end
