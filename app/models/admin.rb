class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable,
         authentication_keys: [:login_name]

  validates :login_name, presence: true, uniqueness: true

  private

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
