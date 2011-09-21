class Post < ActiveRecord::Base
  has_many :comments
  validates_presence_of :tittle, :content
end
