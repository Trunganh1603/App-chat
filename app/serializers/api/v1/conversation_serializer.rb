module Api
	module V1	
		class ConversationSerializer < Api::ApiSerializer
  			set_type :conversation

  			attributes :id, :messenger
		end
	end	
end
