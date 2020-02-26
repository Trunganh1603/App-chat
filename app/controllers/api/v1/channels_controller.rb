module Api
	module V1
		class ChannelsController < Api::ApiController
			before_action :load_resources

			def index
				channels = policy_scope(@channels)
				collection_response(channels, serializer, query_params[:fields], query_params[:includes])
			end

			def show
				json_response(authorize_channel, serializer, writing_params[:fields], writing_params[:includes])
			end

			def create
				service.create(writing_params)
				json_success(authorize_channel, serializer, :created )
			end

			def update
				service.update(writing_params)
				json_success(authorize_channel, serializer)
			end

			def destroy
				channel_serializer = authorize_channel

				service.destroy
				json_success(channel_serializer, serializer, :ok)
			end

			def add_user
				@channel.channels_users.create!(user_id: params[:user_id])
				json_success(authorize_channel, serializer, :created)

				# Xac dinh thang user duoc add vao co ton tai khong
				# Nguoi duoc quyen add vao channel : 2TH
				# TH1: Minh cho phep bat cu user nao trong channel deu dc phep add user khac vao
				# TH2: current_user.owned_channels.find_by_id :channel_id -> tim thay thi add user vao
				# TH2: Channel.find_by_id: :channel_id -> 

				# Tim ra channel dang duoc su dung de add 
				# channel -> Tao channel_users voi channel_id la channel hien tai va user_id la user duoc add vao
			end


			private

			def load_resources
				case params[:action].to_sym
				when :create
					@channel = current_user.owned_channels.new
				when :index
					page = channel_params[:page] || 1
					
					@channels = collection.
								reverse_scope.
                      			ransack_query(query_params, page)
				when :update, :destroy
				
					@channel = Channel.find(params[:id])
				when :show
					@channel = collection.find(params[:channael_id])
				when :add_user
					@channel = Channel.find(params[:id])
				end	
			end

			def writing_params
		        params.require(:channel).permit(
		          :id,
		          :name,
		          :user_id,
		          :parent_id,
		          :status,
		          :role,
		          fields: { channel: [], user: [] },
		          includes: []
		        )
		    end

			def query_params
        		channel_params.permit(
          		:id_eq,
          		:parent_id_eq,
          		:owner_id_eq,
          		fields: { channel: [], user: [] },
          		includes: []
        		)
      		end

      		def channel_params
        		params[:channel].present? ? params.require(:channel) : params
      		end

			def collection
        		Channel.includes(:owner)
      		end

      		def serializer_channels_user
      			Api::V1::ChannelsUserSerializer
      		end

      		def serializer
        		Api::V1::ChannelSerializer
      		end

      		def service
        		ChannelService.new(authorize_channel)
      		end

      		def authorize_channel
        		authorize_with_permissions(@channel)
      		end
		end
	end	
end
