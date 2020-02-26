class CreateConversationImages < ActiveRecord::Migration[6.0]
  def change
    create_table :conversation_images do |t|
      t.references :conversation
      t.string :image

      t.timestamps
    end
  end
end
