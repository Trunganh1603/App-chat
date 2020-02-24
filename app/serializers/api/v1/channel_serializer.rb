module Api
	module V1
		class ChannelSerializer < Api::ApiSerializer
		  set_type :channel

		  attributes :id, :name, :parent_id, :role, :status, :user_id
		end
	end
end
