class Post < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  belongs_to :user

  attr_accessible :title, :body

  validates :title, presence: true
  validates :body, presence: true
end
