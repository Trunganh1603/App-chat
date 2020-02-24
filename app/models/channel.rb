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

class Channel < ApplicationRecord
	#Validations
	#Relationships
   		belongs_to :parent, class_name: "Channel",foreign_key: "parent_id", optional: true
  		has_many :childrens, class_name: "Channel", foreign_key: "parent_id", dependent: :destroy
   		belongs_to :owner, class_name: 'User', foreign_key: 'user_id', inverse_of: 'owned_channels'
   		has_many :channels_users, inverse_of: :channel
   		has_many :users, through: :channels_users, source: :user
   		enum	role: [
		  		:member,
		  		:admin
		].freeze
		enum	status:[
		  		:pri,
		  		:pub
  		].freeze
end
