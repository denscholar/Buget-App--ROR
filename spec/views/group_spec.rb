require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  describe 'Categories' do
    before(:each) do
      @user = User.create! name: 'User Name', password: '123456', email: 'user@email.com', confirmed_at: Time.now
      Group.create! name: 'group', user_id: @user.id, icon: 'Education'

      visit '/users/sign_in'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Next'
    end

    scenario 'I see page header' do
      expect(page).to have_content('CATEGORIES')
    end

    scenario 'I can see a category I added' do
      expect(page).to have_content('group')
    end

    scenario 'A NEW CATEGORY page' do
      click_link 'ADD A NEW CATEGORY'
      expect(page).to have_content('Select label for an icon')
    end
  end
end
