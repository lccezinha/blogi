require 'rails_helper'

RSpec.describe 'Listing all posts', :type => :controller do
  before do
    @posts = 10.times { double('post') }
  end

  it 'list al posts' do
    visit posts_path

    expect(page).to have_text("List Posts")
  end
end
