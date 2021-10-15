class CreateKakeibos < ActiveRecord::Migration[5.2]
  def change
    create_table :kakeibos do |t|
      t.integer :user_id, null: false #ユーザーのID
      t.string :name, null: false #家計簿名
      t.boolean :is_kakeibo_status, null: false, default: false #ガチャ家計簿かその他家計簿かを判別する false:その他家計簿、true:ガチャ家計簿

      t.timestamps
    end
  end
end
