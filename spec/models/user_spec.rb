require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Association tests' do
    it 'has many projects' do
      user = User.reflect_on_association(:projects)
      expect(user.macro).to eq(:has_many)
    end

    it 'has many coursemodules' do
      user = User.reflect_on_association(:coursemodules)
      expect(user.macro).to eq(:has_many)
    end
  end

  context 'validation test' do
    user_param1 = {
      username: 'user1',
      email: 'user1@mail.com'
    }
    user_param2 = {
      username: 'user1',
      email: 'user1@mail.com'
    }
    it 'should create a valid user' do
      user = User.create(user_param1)
      expect(user).to be_valid
    end

    it 'should not create a valid user' do
      User.create!(user_param1)
      user1 = User.create(user_param2)
      expect(user1).to_not be_valid
    end
  end
end
