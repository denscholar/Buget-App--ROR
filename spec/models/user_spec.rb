require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.new(name: 'user', email: 'user@mail.com', password: '123456', confirmed_at: Time.now)
  end
  before { subject.save }

  it 'name should not be nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name should not be empty' do
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'length of name should not be less than 3' do
    subject.name = 'ab'
    expect(subject).to_not be_valid
  end

  it 'length of name should not be more than 100' do
    subject.name = 'ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc'
    expect(subject).to_not be_valid
  end

  it 'should valid the name' do
    subject.name = 'user'
    expect(subject).to be_valid
  end

  it 'email should not be empty' do
    subject.email = ''
    expect(subject).to_not be_valid
  end

  it 'email should not be nil' do
    subject.email = nil
    expect(subject).to_not be_valid
  end
end
