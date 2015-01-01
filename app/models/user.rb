class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         authentication_keys: [:login_name]

  validates :login_name, presence: true
  validates :login_name, uniqueness: true

  private

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
