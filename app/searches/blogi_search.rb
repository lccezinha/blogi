class BlogiSearch
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
    query = {
      bool: {
        should: [
          {
            match: {
              title: {
                query: @search_term,
                operator: 'and',
                boost: 10
              }
            }
          },
          {
            match: { description: @search_term }
          }
        ]
      }
    }
    index.query(query) if @search_term.present?
  end

  def index
    BlogiIndex
  end
end
