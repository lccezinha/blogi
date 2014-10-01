class Post < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name AppConfig['index']
  document_type 'post'

  belongs_to :author
  belongs_to :category

  validates :title, presence: true
  validates :description, presence: true

  def as_indexed_json(options = {})
    other_fields = {
      author_name: author.name,
      category_name: category.name
    }
    self.as_json.symbolize_keys.slice(*%i(title description)).merge(other_fields)
  end
end
