class AccessTicket < ActiveRecord::Base
  attr_accessor :encrypted_password
  belongs_to :user

  devise :database_authenticatable, authentication_keys: [:id]
end
