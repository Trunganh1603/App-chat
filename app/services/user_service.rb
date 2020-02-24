class UserService
  def initialize(user)
    @user = user
  end

  def update(attributes)
    record.assign_attributes(attributes)
    record.save!
  end

  def edit_profile(attributes)
    record.assign_attributes(attributes)
    record.save!
  end

  def register(attributes)
    record.assign_attributes(attributes)
    record.save!
  end

  def destroy
    record.destroy!
  end

  private

  attr_accessor :user

  def record
    user.record
  end
end
