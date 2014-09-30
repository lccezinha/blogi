class Post < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name 'blogi'
  document_type 'post'

  belongs_to :author
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true
end
