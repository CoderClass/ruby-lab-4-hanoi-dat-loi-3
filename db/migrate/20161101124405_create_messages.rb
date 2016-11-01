class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :room_id, index: true
      t.string :username
      t.text :content

      t.timestamps
    end
  end
end
