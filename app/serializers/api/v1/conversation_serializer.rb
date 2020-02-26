module Api
	module V1
		class ConversationSerializer < Api::ApiSerializer
		  set_type :conversation

		  attributes :id, :messenger, :role, :roomable_id, :roomable_type

		  attribute :conversation_images do |object|
		    {
		      image: object.conversation_images.image
		    }
		  end

		end
	end
end
