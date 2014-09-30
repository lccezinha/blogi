class PostsSearchEngine

  def self.search(options = {})
    if options[:term].blank?
      Post.search({}).records.to_a
    else
      Post.search(options[:term]).records.to_a
    end
  end

end