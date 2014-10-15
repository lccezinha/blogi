class PostsSearchEngine

  # curl -X GET 'http://localhost:9200/blogi/post/_search?pretty' -d '{"facets": { "category_name": { "terms": { "field": "category_name" } } } } } }'
  def self.search(options = {})
    if options[:term].blank?
      query = {
        query: {
          match_all: {}
        },
        facets: {
          category_name: {
            terms: {
              field: :category_name
            }
          },
          author_name: {
            terms: {
              field: 'author_name.raw'
            }
          }
        },
        size: 1000
      }
      Post.search(query.to_json)
    else
      # query = {
      #   query: {
      #     bool: {
      #       should: [
      #         { match: { title: { query: options[:term], operator: 'and' } } }
      #       ],
      #       minimum_should_match: 1
      #     }
      #   },
      #   size: 1000
      # }
      query = {
        query: {
          bool: {
            should: [
              { match: { title: options[:term] } },
              { match: { description: options[:term] } }
            ],
            minimum_should_match: 1
          }
        },
        facets: {
          category_name: {
            terms: {
              field: :category_name
            }
          },
          author_name: {
            terms: {
              field: 'author_name.raw'
            }
          }
        },
        size: 1000
      }
      Post.search(query.to_json)
    end
  end

end