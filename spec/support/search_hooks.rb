module SearchHooks
  extend ActiveSupport::Concern

  included do
    before(:each) do
      client = Elasticsearch::Client.new
      index = 'test.blogi'
      client.indices.create index: index unless client.indices.exists index: index
      client.delete_by_query index: index, body: { query: { match_all: {} } }
    end
    after(:all) do
      client = Elasticsearch::Client.new
      index = 'test.blogi'
      client.indices.delete index: index
      client.indices.clear_cache
    end
  end
end