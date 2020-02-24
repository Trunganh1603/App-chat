module Api
	module V1
		class UserSerializer < Api::ApiSerializer
			set_type :user

			attributes :id, :email, :name, :role
		end	
	end	
end	