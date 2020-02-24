class UserPolicy < ApplicationPolicy
  # allows all roles but with different permissions
  def index?
    return Guest.new(record) unless user

    Regular.new(record)
  end

  def show?
    return Guest.new(record) unless user

    Regular.new(record)
  end

  def profile?
    return Guest.new(record) unless user

    Regular.new(record)
  end

  def edit_profile?
    raise CustomErrors::PermissionError unless user.admin?

    Regular.new(record)
  end

  def register?
  	return Guest.new(record)
  end

  def login?
  	return Guest.new(record)
  end

  # allows only Admin and Regular roles, each with different permissions
  def update?
    raise CustomErrors::PermissionError unless record.id == user.id

    Regular.new(record)
  end

  def destroy?
    raise Pundit::NotAuthorizedError unless user

    Regular.new(record)
  end

  class Scope < ApplicationScope
    def resolve
      return Guest.new(scope, User) unless user

      Regular.new(scope, User)
    end
  end

  # regular has access to everything, plus, some extra fields
  class Regular < FlexiblePermissions::Base
    class Fields < self::Fields
      def permitted
        super + %i(
          links related
        )
      end
    end
  end

  # and we chop even more for a guest
  class Guest < Regular
    class Fields < self::Fields
      def permitted
        super - %i(password_digest id email)
      end
    end
  end
end
