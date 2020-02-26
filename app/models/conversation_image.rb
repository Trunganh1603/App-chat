# == Schema Information
#
# Table name: conversation_images
#
#  id              :bigint           not null, primary key
#  image           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint
#
# Indexes
#
#  index_conversation_images_on_conversation_id  (conversation_id)
#

class ConversationImage < ApplicationRecord
	#uploader image
	mount_uploader :image, ImageUploader
	#Relationships
  	belongs_to :conversation, inverse_of: :conversation_images
end
