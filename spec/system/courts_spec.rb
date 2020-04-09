require 'rails_helper'

describe 'コート表示機能', type: :system do
  describe '一覧表示機能' do
    before do
      @court_a = FactoryBot.create(:court)
      @user_a = FactoryBot.create(:user)
      # @favorite_a = FactoryBot.create(:favorite, user: @user_a, court: @court_a)
    end

    context 'ユーザー Aがログインしているとき' do
      before do
        visit login_path
        fill_in 'メールアドレス', with: 'test1234@example.com'
        fill_in 'パスワード', with: '123456'
        click_button 'ログインする'
        visit root_path
      end

      scenario 'お気に入りボタンが表示されること' do
        expect(page).to have_selector('#create-favorite')
      end

      scenario 'お気に入りボタンの表示が変わる' do
        find('#create-favorite').click
        wait_for_ajax
        expect(page).to have_selector('#destroy-favorite')
        find('#destroy-favorite').click
        wait_for_ajax
        expect(page).to have_selector('#create-favorite')
      end
    end

    context 'ユーザー Aがログインしていないとき' do
      before do
        visit root_path
      end
      
      scenario 'お気に入りボタンが表示されない' do
        expect(page).not_to have_selector('#create-favorite')
        expect(page).not_to have_selector('#destroy-favorite')
      end
    end
  end
end
