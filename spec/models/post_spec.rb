require 'rails_helper'

RSpec.describe Post, :type => :model do
  context 'modules' do
    it { expect(described_class.ancestors).to include(Elasticsearch::Model) }
    it { expect(described_class.ancestors).to include(Elasticsearch::Model::Callbacks) }
  end

  it { expect(described_class).to respond_to(:search) }
  it { expect(described_class.new).to respond_to(:as_indexed_json) }

  context 'associations' do
    it { should belong_to(:author) }
    it { should belong_to(:category) }
  end

  context 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :description }
  end
end
