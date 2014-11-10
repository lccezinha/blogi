class BlogiIndex < Chewy::Index
  settings analysis: {
    analyzer: {
      title: {
        tokenizer: 'standard',
        filter: ['lowercase', 'asciifolding']
      }
    }
  }

  define_type Post.includes(:author, :category), name: 'post' do
    field :title, analyzer: 'title'
    field :description
    field :author, index: 'not_analyzed', value: ->{ author.name }
    field :category, index: 'not_analyzed', value: ->{ category.name }
    field :created_at, index: 'not_analyzed', type: 'date'
  end
end
