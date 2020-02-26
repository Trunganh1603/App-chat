module Api
  	module V1
		class ConversationsController < Api::ApiController
			before_action :load_resources

			def index
				conversations = policy_scope(@conversations)
        		collection_response(conversations, serializer, query_params[:fields], query_params[:includes])
			end

			def show
				json_response(authorize_conversation, serializer, writing_params[:fields], writing_params[:includes])
			end

			def create
				service.create(writing_params)
				json_success(authorize_conversation, serializer, :created )
			end

			def update
        		service.update(writing_params)
        		json_success(authorize_conversation, serializer, :ok)
      		end

			def destroy
				conversation_serializer = authorize_conversation

				service.destroy
				json_success(conversation_serializer, serializer, :ok)
			end

			private

			def load_resources
				case params[:action].to_sym
				when :create
					@conversation = current_user.conversations.new
					#@conversation_images = @conversation.conversation_images.new
				when :index
					page = conversation_params[:page] || 1
					
					@conversations = collection.
								reverse_scope.
                      			ransack_query(query_params, page)
					#@conversation_images = @conversation.conversation_images.all
				when :destroy, :update
					@conversation = current_user.conversations.find(params[:id])
				when :show
					@conversation = collection.find(params[:id])
				end	
			end

			def writing_params
				params.require(:conversation).permit(:id, :messenger, :role, conversation_images_attributes: [:image])
			end

			def query_params
        		conversation_params.permit(
          		:id_eq, :messenger_eq, :channel_id_eq, :user_id_eq,
          		fields: { conversation: [], channel: [], user: [] },
          		includes: []
        		)
      		end

      		def conversation_params
        		params[:conversation].present? ? params.require(:conversation) : params
      		end

			def images
				params[conversation_images: :image].each do |i|
          			@conversation_image = @conversation.conversation_image.create!(:image => i, :conversation_id => @conversation.id)
       			end	
			end

			def collection
        		Conversation.includes(:conversations)
      		end

      		def serializer
        		Api::V1::ConversationSerializer
      		end

      		def service
        		ConversationService.new(authorize_conversation)
      		end

      		def authorize_conversation
        		authorize_with_permissions(@conversation)
      		end
		end
	end	
end	
