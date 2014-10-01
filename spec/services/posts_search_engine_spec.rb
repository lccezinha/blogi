require 'rails_helper'

RSpec.describe PostsSearchEngine, type: :service do
  include SearchHooks

  it { expect(described_class).to respond_to(:search) }

  context 'seaching' do
    let(:author_one)   { create(:author, name: 'Gzuis Niga') }
    let(:author_two)   { create(:author, name: 'Pelé Branco') }
    let(:author_three) { create(:author, name: 'Kratos of War') }

    let(:category_one)   { create(:category, name: 'Esportes') }
    let(:category_two)   { create(:category, name: 'Programação') }
    let(:category_three) { create(:category, name: 'Música') }

    let(:post_one) { create(:post, title: 'First Post', description: 'Some shit about CDA', author_id: author_one.id, category_id: category_one.id) }
    let(:post_two) { create(:post, title: 'Seconde Shit', description: 'Nothing works in this project, why?', author_id: author_two.id, category_id: category_two.id) }
    let(:post_three) { create(:post, title: 'Awesome thing', description: 'master of tickets is an awesome project!', author_id: author_three.id, category_id: category_three.id) }

    it 'find anything' do
      post_one
      post_two
      post_three

      results = PostsSearchEngine.search(term: 'First Post')
      p results
    end
  end

end