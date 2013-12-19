class Answer < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  attr_accessible :message, :user_id

  validates :message,:user_id, presence: true
end
