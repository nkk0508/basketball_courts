require 'rails_helper'

RSpec.describe Court, type: :model do
  describe 'associations' do
    describe 'has_many' do
      it { is_expected.to have_many(:favorites).dependent(:destroy) }
      it { is_expected.to have_many(:users).through(:favorites) }
    end
  end

  describe 'validations' do
    it 'is invalid without a name' do
      court = FactoryBot.build(:court, name: nil)
      court.valid?
      expect(court.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a categories' do
      court = FactoryBot.build(:court, categories: nil)
      court.valid?
      expect(court.errors[:categories]).to include("can't be blank")
    end

    it 'is invalid without a non_residents' do
      court = FactoryBot.build(:court, non_residents: nil)
      court.valid?
      expect(court.errors[:non_residents]).to include("can't be blank")
    end

    it 'is invalid without a postal_code' do
      court = FactoryBot.build(:court, postal_code: nil)
      court.valid?
      expect(court.errors[:postal_code]).to include("can't be blank")
    end

    it 'is invalid without a address' do
      court = FactoryBot.build(:court, address: nil)
      court.valid?
      expect(court.errors[:address]).to include("can't be blank")
    end

    it 'is invalid without a location_information' do
      court = FactoryBot.build(:court, location_information: nil)
      court.valid?
      expect(court.errors[:location_information]).to include("can't be blank")
    end

    it 'is invalid without a access_count' do
      court = FactoryBot.build(:court, access_count: nil)
      court.valid?
      expect(court.errors[:access_count]).to include("can't be blank")
    end

    it 'is invalid without a favorite_count' do
      court = FactoryBot.build(:court, favorite_count: nil)
      court.valid?
      expect(court.errors[:favorite_count]).to include("can't be blank")
    end
  end

  describe 'methods' do
    describe '#ward' do
      it 'returns 品川区' do
        court = FactoryBot.build(:court)
        expect(court.ward).to eq '品川区'
      end
    end
  end
end
