module Api
	module V1
		class ChannelSerializer < Api::ApiSerializer
		  set_type :channel

		  attributes :id, :name, :parent_id, :role, :status, :user_id

		  attribute :channels_users do |object|
		    {
		      user_id: object.channels_users.user_id,
		      channel_id: object.channels_users.channel_id
		    }
		  end
		end
	end
end
