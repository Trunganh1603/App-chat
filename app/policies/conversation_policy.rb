class ConversationPolicy < ApplicationPolicy
	def index?
    	Guest.new(record)
	end

	def show?
		return Guest.new(record).permitted unless user
		
		Regular.new(record)
	end

	def create?
		raise_error_if_unauthorize!

		Regular.new(record)
	end

	def update?
		raise_error_if_unauthorize!

		raise CustomErrors::PermissionError unless author_permission?
		Regular.new(record)
	end

	def destroy?
		raise_error_if_unauthorize!
		
		raise CustomErrors::PermissionError unless author_permission?
		Regular.new(record)
	end

	 class Scope < ApplicationScope
		def resolve
		    return Guest.new(scope, Conversation) unless user

		      	Regular.new(scope, Conversation)
		    end
  		end

	class Regular < FlexiblePermissions::Base
		class Fields < self::Fields
			def permitted
				super + [
					:links, :related
				]
			end
		end	
	end

	class Guest < Regular
		class Fields < self::Fields
			def permitted
				super - [
					:id 
				]
			end
		end
	end

	private	

	def author_permission? 
		user.admin? || user.conversation.where(id: record.id).exists?
	end
end