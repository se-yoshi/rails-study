class AccessTicket < ActiveRecord::Base
  attr_accessor :encrypted_password
  belongs_to :user
  before_create :generate_authentication_token, if: -> { authentication_token.blank? }

  devise :database_authenticatable, authentication_keys: [:id]

  validates :available_times, numericality: { only_integer: true, greater_than: 0 }

  def generate_authentication_token
    self.authentication_token = SecureRandom.urlsafe_base64(128)
  end
end
