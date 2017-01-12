class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :slack_id, presence: true
      t.string :username, unique: true

      t.timestamps
    end
  end
end
