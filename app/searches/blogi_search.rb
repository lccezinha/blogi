class BlogiSearch

  PerPage = 5

  def initialize(params)
    @search_term = params[:search_term]
    @category    = params[:category]
    @author      = params[:author]
    @page        = params[:page]
  end

  def search
    [match_all, query_string, filter_by_category, filter_by_author, sort, size].compact.reduce(:merge)
  end

  def facets
    index.facets({
      author: { terms: { field: :author } },
      category: { terms: { field: :category } }
    }).facets
  end

  private

  def size
    index.query.per(PerPage).page(@page)
  end

  def sort
    index.order(created_at: { order: :desc })
  end

  def match_all
    index.query(match_all: {})
  end

  def filter_by_category
    index.filter(term: { category: @category }) if @category.present?
  end

  def filter_by_author
    index.filter(term: { author: @author }) if @author.present?
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
