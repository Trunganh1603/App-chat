class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.string	:name
      t.string  :messager
      t.integer :parent_id
      t.integer :role, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.references :user, foreign_key: true
      t.timestamps
    end
      add_index :channels, :parent_id
  end
end
