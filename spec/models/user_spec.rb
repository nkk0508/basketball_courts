require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    describe 'has_many' do
      it { is_expected.to have_many(:favorites).dependent(:destroy) }
      it { is_expected.to have_many(:courts).through(:favorites) }
    end
  end

  describe 'validations' do
    describe 'name' do
      it 'is invalid without a name' do
        user = FactoryBot.build(:user, name: nil)
        user.valid?
        expect(user.errors[:name]).to include("can't be blank")
      end

      it 'is invalid without a valid name length' do
        user = FactoryBot.build(:user, name: Faker::Lorem.characters(number: 51))
        user.valid?
        expect(user.errors[:name]).to include("is too long (maximum is 50 characters)")
      end
    end

    describe 'email' do
      it 'is invalid without a email' do
        user = FactoryBot.build(:user, email: nil)
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end

      it 'is invalid without a valid email length' do
        user = FactoryBot.build(:user, email: Faker::Lorem.characters(number: 255))
        user.valid?
        expect(user.errors[:email]).to include("is too long (maximum is 254 characters)")
      end

      it 'is invalid without a valid email format' do
        user = FactoryBot.build(:user, email: 'test@')
        user.valid?
        expect(user.errors[:email]).to include("is invalid")
      end

      it 'is invalid without a valid unique email' do
        userA = FactoryBot.build(:user)
        userB = FactoryBot.build(:user)
        userA.save
        userB.valid?
        expect(userB.errors[:email]).to include("has already been taken")
      end
    end

    describe 'password' do
      it 'is invalid without a password' do
        user = FactoryBot.build(:user, password: nil)
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end

      it 'is invalid without a valid password length' do
        short_password_user = FactoryBot.build(:user, password: Faker::Lorem.characters(number: 5))
        long_password_user = FactoryBot.build(:user, password: Faker::Lorem.characters(number: 201))
        short_password_user.valid?
        long_password_user.valid?
        expect(short_password_user.errors[:password]).to include("is too short (minimum is 6 characters)")
        expect(long_password_user.errors[:password]).to include("is too long (maximum is 200 characters)")
      end
    end
  end

  describe 'methods' do
    describe '#remember' do
      it 'sets password to remember_digest' do
        user = FactoryBot.build(:user)
        user.remember
        expect(user.remember_digest.nil?).to be false
      end
    end

    describe '#forget' do
      it 'sets nil to remember_digest' do
        user = FactoryBot.build(:user)
        user.remember
        user.forget
        expect(user.remember_digest.nil?).to be true
      end
    end
  end
end
