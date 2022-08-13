require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(id: 1, name: 'user', email: 'user@mail.com', password: '123456', confirmed_at: Time.now) }
  let(:group) { Group.create(id: 2, name: 'Buying', icon: 'Buying', user_id: user.id) }

  describe 'Validations' do
    it 'should be valid' do
      expect(group).to be_valid
    end

    it 'should allow valid name' do
      group.name = ''
      expect(group).to_not be_valid
    end

    it 'should allow valid name' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'With nme length more than 100 should not be valid' do
      group.name = 'qwertyuiopasdfghjklzxcvbnm,qwertyuiopasdfghjklzxcvbnmqwertyuiopasdfghj,qwertyuiopasdfghjklzxcvbnm,,qwertyuiopasdfghjklzxcvbnm,'
      expect(group).to_not be_valid
    end

    it 'should allow valid user_id' do
      group.user_id = nil
      expect(group).to_not be_valid
    end
  end
end
