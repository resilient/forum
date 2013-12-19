class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable, and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :role
  # attr_accessible :title, :body

  validates :username, presence: true

  ROLES = %w[admin moderator user]

	has_many :posts, dependent: :destroy
	has_many :answers, dependent: :destroy
end
