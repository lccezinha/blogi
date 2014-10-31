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
    field :author, value: ->{ author.name }
    field :category, value: ->{ category.name }
  end
end
