require 'rails_helper'

RSpec.describe PostsSearchEngine, type: :service do

  it { expect(described_class).to respond_to(:search) }

end