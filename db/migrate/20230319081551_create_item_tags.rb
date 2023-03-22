class CreateItemTags < ActiveRecord::Migration[6.1]
  def change
    create_table :item_tags do |t|

      t.integer :item_id, null: false
      t.integer :ttag_id, null: false

      t.timestamps
    end

        # 同じタグを２回保存するのは出来ないようになる
    add_index :item_tags, [:item_id, :ttag_id], unique: true

  end
end
