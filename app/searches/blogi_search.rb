class BlogiSearch
  include ActiveModel::Model
  Fields = [:title, :description]

  def initialize(search_term)
    @search_term = search_term
  end

  def search
    [match_all, query_string].compact.reduce(:merge)
  end

  def facets
    index.facets({
      author: { terms: { field: :author } },
      category: { terms: { field: :category } }
    }).facets
  end

  private

  def match_all
    index.query(match_all: {})
  end

  def query_string
    index.query(query_string: { fields: Fields, query: @search_term, default_operator: 'and' }) if @search_term.present?
  end

  def index
    BlogiIndex
  end
end
