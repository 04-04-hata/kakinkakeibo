class GachaKakeibo < ApplicationRecord

  belongs_to :user
  belongs_to :kakeibo

  enum winning_count:{one:1,two:2,three:3,four:4,five_times_or_more:5}

end
