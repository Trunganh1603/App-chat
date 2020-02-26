# == Schema Information
#
# Table name: conversation_images
#
#  id              :bigint           not null, primary key
#  image           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint
#
# Indexes
#
#  index_conversation_images_on_conversation_id  (conversation_id)
#

require 'test_helper'

class ConversationImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
