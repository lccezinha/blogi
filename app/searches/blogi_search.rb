class BlogiSearch
  def initialize(params)
    @search_term = params[:search_term]
    @category    = params[:category]
  end

  def search
    [match_all, query_string, filter_by_category].compact.reduce(:merge)
  end

  def facets
    index.facets({
      author: { terms: { field: :author } },
      category: { terms: { field: :category } }
    }).facets
  end

  def filter_by_category
    index.filter(term: { category: @category }) if @category.present?
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
