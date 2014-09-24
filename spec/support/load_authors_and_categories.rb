shared_examples_for 'load_authors_and_categories' do
  it 'load all authors' do
    author_one = create(:author)
    author_two = create(:author)

    authors = [author_one, author_two]

    get :new
    expect(assigns(:authors)).to match_array(authors)
  end

  it 'load all categories' do
    category_one = create(:category)
    category_two = create(:category)

    categories = [category_one, category_two]

    get :new
    expect(assigns(:categories)).to match_array(categories)
  end
end