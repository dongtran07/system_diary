class Type < ActiveRecord::Base
  has_one :post
  validates :name, uniqueness:true, presence: true
  validates :class_icon, presence: true
end
