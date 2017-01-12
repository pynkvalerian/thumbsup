class CreateThumbsUps < ActiveRecord::Migration[5.0]
  def change
    create_table :thumbs_ups do |t|
      t.integer :sender_id
      t.text :message, presence: true
      t.integer :receiver_id

      t.timestamps
    end

    add_index :thumbs_ups, :sender_id
    add_index :thumbs_ups, :receiver_id
  end
end
