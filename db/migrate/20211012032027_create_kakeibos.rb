class CreateKakeibos < ActiveRecord::Migration[5.2]
  def change
    create_table :kakeibos do |t|
      t.integer :users_id, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
