class ChannelService
  def initialize(channel)
    @channel = channel
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

  attr_accessor :channel

  def record
    channel.record
  end
end
