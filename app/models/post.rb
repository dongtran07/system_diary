class Post < ActiveRecord::Base
  include Bootsy::Container
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
  acts_as_commentable
  belongs_to :user
  belongs_to :type
end
