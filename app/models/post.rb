class Post < ActiveRecord::Base
  belongs_to :author
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true
end
