class CreateGachaKakeibos < ActiveRecord::Migration[5.2]
  def change
    create_table :gacha_kakeibos do |t|
      
      t.integer :users_id, null: false #ユーザーのid
      t.integer :kakeibos_id, null: false #家計簿のid
      t.string  :object, null: false #目的の物
      t.integer :billing_amount, null: false #課金額
      t.integer :single_gacha, null: false #単発ガチャ回数
      t.integer :ten_combo_gacha, null: false #10連ガチャ回数
      t.integer :total, null: false #単発、１０連を含めたガチャの回数
      t.boolean :is_result_status, null: false, default: false #当選か落選か(false:落選、true:当選)
      t.integer :winning_count, null: false, default: 0 #当選回数 0:0回、1:1回、2:2回、3:3回、4:4回、5:5回以上
      t.integer :billing_item, null: false #消費した課金アイテムの数
      t.string  :remarks, null: false, default: "" #備考
      
      t.timestamps
    end
  end
end
