# == Schema Information
#
# Table name: channels_users
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  channel_id :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_channels_users_on_channel_id  (channel_id)
#  index_channels_users_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (channel_id => channels.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class ChannelsUserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
