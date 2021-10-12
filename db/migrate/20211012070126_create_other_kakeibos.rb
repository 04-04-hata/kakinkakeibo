class CreateOtherKakeibos < ActiveRecord::Migration[5.2]
  def change
    create_table :other_kakeibos do |t|
      
      t.integer :users_id, null: false
      t.integer :kakeibos_id, null: false
      t.string  :object, null: false
      t.integer :billing_amount, null: false
      t.string  :remarks, null: false, default: ""
      
      t.timestamps
    end
  end
end
