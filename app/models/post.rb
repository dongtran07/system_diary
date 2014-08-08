class Post < ActiveRecord::Base
  include Bootsy::Container
  acts_as_commentable
  acts_as_taggable
  belongs_to :user
  belongs_to :type
  validates :content, presence: true
end
