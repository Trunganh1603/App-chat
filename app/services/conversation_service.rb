class ConversationService
  def initialize(conversation)
    @conversation = conversation
  end

  def create(attributes)
      record.assign_attributes(attributes)
      record.save!
  end

  def update(attributes)
      record.assign_attributes(attributes)
      record.save!
  end

  def destroy
    record.destroy!
  end

  private

  attr_accessor :conversation

  def record
    conversation.record
  end
end
