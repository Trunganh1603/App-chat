# == Schema Information
#
# Table name: conversations
#
#  id            :bigint           not null, primary key
#  image         :json
#  messenger     :string
#  role          :integer          default("many"), not null
#  roomable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  roomable_id   :bigint
#
# Indexes
#
#  index_conversations_on_roomable_type_and_roomable_id  (roomable_type,roomable_id)
#

class Conversation < ApplicationRecord
	#Validations
	#uploader image
	#Relationships
	belongs_to :roomable, polymorphic: true
	has_many :conversations, as: :roomable, dependent: :destroy
	has_many :conversation_images, inverse_of: :conversation
	accepts_nested_attributes_for :conversation_images, allow_destroy: true, reject_if: proc { |attributes| attributes['image'].blank? }

	enum role: [
		:many,
		:one
	].freeze
end
