module Api
  	module V1
    	class UsersController < Api::ApiController
			skip_before_action :authenticate_request, only: %i[login register]
			before_action :load_resources
			def index
		        users = policy_scope(@users)
		        collection_response(users, serializer, query_params[:fields], query_params[:includes])
		    end

		    def show
		        json_response(authorize_user, serializer, user_params[:fields], user_params[:includes])
		    end

		    def profile
		        json_response(authorize_user, serializer, user_params[:fields], user_params[:includes])
		    end

		    def update
		        service.update(normalized_params)
		        json_success(authorize_user, serializer)
		    end

		    def edit_profile
		        service.edit_profile(normalized_params)
		        json_success(authorize_user, serializer)
		    end

		 	def register
				    @user = User.create(normalized_params)
				   if @user.save
				   	json_success(authorize_user, serializer, :created )
				   else
				    render json: @user.errors, message: I18n.t("auth.messages.register.duplicate")
				   end
			end

			def login
    			authenticate params[:email], params[:password]
  			end

		 	private
		  	
		  	def authenticate(email, password)
			    command = AuthenticateUser.call(email, password)

			    if command.success?
			      render json: {
			        access_token: command.result,
			        message:   I18n.t("auth.messages.login.success")
			      }
			    else
			      render json: { error: command.errors }, status: :unauthorized
			    end
		   	end

		   	def load_resources
		        page = user_params[:page] || 1
		        case params[:action].to_sym
		        when :update, :follow
		          @user = current_user
		        when :show
		          @user = params[:id].present? ? User.find(params[:id]) : current_user
		        when :profile
		          @user = current_user
		        when :index
		          @users = User.
		                   ransack_query(query_params, page)
		        when :edit_profile
		          @user = User.find(params[:id])
		        when :register
		        	@user = User.new(normalized_params)
		        end
		    end

		    def normalized_params
		        params.require(:user).permit(
		          :id,
		          :name,
		          :email,
		          :password,
		          :role
		        )
		    end

		   	def user_params
		        params[:user].present? ? params.require(:user) : params
		    end

		    def query_params
		        user_params.permit(
		        :created_at,
		      	fields: {}, 
		      	includes: []
		      	)
		    end

		   	def authorize_user
        		authorize_with_permissions(@user)
      		end

      		def serializer
        		Api::V1::UserSerializer
      		end

		   	def service
        		UserService.new(authorize_user)
      		end
		end
	end
end	