require 'rails_helper'

RSpec.describe Author, :type => :model do

  context 'associations' do
    it { should have_many(:posts) }
  end

end
