# == Schema Information
#
# Table name: conversations
#
#  id            :bigint           not null, primary key
#  image         :json
#  messenger     :string
#  role          :integer          default("many"), not null
#  roomable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  roomable_id   :bigint
#
# Indexes
#
#  index_conversations_on_roomable_type_and_roomable_id  (roomable_type,roomable_id)
#

require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
