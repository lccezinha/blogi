require 'rails_helper'

RSpec.describe 'Create a new post', :type => :controller do
  it '#create' do
    visit new_post_path

    fill_in :post_title, with: 'Testing'
    fill_in :post_description, with: 'Testing'
    select 'Gzuis', from: 'post_author_id'

    # t.references :author, index: true
    #   t.references :category, index: true
    #   t.string :title
    #   t.text :description

    # expect(page).to have_text("New Post")
  end
end
