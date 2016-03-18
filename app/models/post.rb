class Post < ActiveRecord::Base
  validates :comment, presence: true
end
