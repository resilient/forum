class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :rememberable

  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :role

  before_save :role_value

  ROLES = %w[admin moderator user]

  validates :email, uniqueness: true
  validates :email, presence: true
  validates :email, format: { with: Devise.email_regexp }
  validates :username, presence: true
  validates :password, presence: true, on: :create
  validates :role, inclusion: ROLES, allow_blank: true
  validates :password, length: { within: Devise.password_length }, allow_blank: true

	has_many :posts, dependent: :destroy
	has_many :answers, dependent: :destroy

  protected
	  def role_value
		  self.role ||= 'user'
	  end
end
