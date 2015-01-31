class User < ActiveRecord::Base
  has_one :user_attribute, dependent: :destroy
  has_many :access_tickets, dependent: :destroy
  accepts_nested_attributes_for :user_attribute

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
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
