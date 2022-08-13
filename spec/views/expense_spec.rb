require 'rails_helper'

RSpec.describe 'Expense', type: :feature do
  describe 'Expense' do
    before(:each) do
      @user = User.create!(name: 'User Name', password: '123456', email: 'user@email.com', confirmed_at: Time.now)
      @group = Group.create!(name: 'group', user_id: @user.id, icon: 'Education')
      Expense.create!(name: 'Expense', user_id: @user.id, amount: 20, group_id: @group.id)
      Expense.create!(name: 'new Expense', user_id: @user.id, amount: 20, group_id: @group.id)

      visit '/users/sign_in'
      fill_in 'Email', with: 'user@email.com'
      fill_in 'Password', with: '123456'
      click_button 'Next'
    end

    scenario 'I can see an expense I added' do
      click_link 'group'
      expect(page).to have_content('Expense')
      expect(page).to have_content('40')
    end

    scenario 'I can see a total expense amount' do
      click_link 'group'
      expect(page).to have_content('new Expense')
      expect(page).to have_content('40')
    end

    scenario 'I can add a new expense' do
      click_link 'group'
      expect(page).to have_content('Add a new expense')
    end
  end
end
