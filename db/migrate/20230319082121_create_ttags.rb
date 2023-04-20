class CreateTtags < ActiveRecord::Migration[6.1]
  def change
    create_table :ttags do |t|

      t.string :tag_name, null: false

      t.timestamps
    end
    add_index :ttags,:tag_name, unique: true
  end
end
