# == Schema Information
#
# Table name: channels
#
#  id         :bigint           not null, primary key
#  messager   :string
#  name       :string
#  role       :integer          default("member"), not null
#  status     :integer          default("pri"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  parent_id  :integer
#  user_id    :bigint
#
# Indexes
#
#  index_channels_on_parent_id  (parent_id)
#  index_channels_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
