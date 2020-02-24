class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversations do |t|
      t.string	:messenger
      t.json	:image
      t.integer	:role
      
      t.references :roomable, polymorphic: true

      t.timestamps
    end
  end
end
