# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  avatar          :string
#  email           :string
#  name            :string
#  password_digest :string
#  role            :integer          default(0), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
	#Validations
	   validates_presence_of :name, :email, :password_digest
	   validates :email, uniqueness: true
	#encrypt password
   		has_secure_password
   	#Relationships
   		has_many :owned_channels, foreign_key: 'user_id', class_name: 'Channel', inverse_of: :owner
   		has_many :channels_users,  inverse_of: :user
   		has_many :channels, through: :channels_users, source: :channel
end
