class BlogiSearch
  include ActiveModel::Model
  attr_reader :query
  Fields = [:title, :description, :author, :category]

  def search
    [query_string].compact.reduce(:merge)
  end

  def query_string
    index.query(query_string: { fields: Fields, query: query, default_operator: 'or' }) if query?
  end

  private

  def index
    BlogiIndex
  end
end
