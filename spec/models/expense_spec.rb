require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(id: 1, name: 'user', email: 'user@mail.com', password: '123456', confirmed_at: Time.now) }
  let(:group) { Group.create(id: 2, name: 'Buying', icon: 'Buying', user_id: user.id) }
  let(:expense) { Expense.create(id: 1, name: 'Dress', amount: 25, user_id: user.id, group_id: group.id) }

  describe 'Expense validations' do
    context 'when valid' do
      it { expect(expense).to be_valid }
    end

    it 'Without name it is invalid ' do
      expense.name = nil
      expect(expense).to_not be_valid
    end

    it 'With nil amount it should not be invalid ' do
      expense.amount = nil
      expect(expense).to_not be_valid
    end

    it 'With negative amount it should not be invalid ' do
      expense.amount = -5
      expect(expense).to_not be_valid
    end
  end
end
