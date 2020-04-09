require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'associations' do
    describe 'belongs_to' do
      it { is_expected.to belong_to(:user) }
      it { is_expected.to belong_to(:court) }
    end
  end
end
