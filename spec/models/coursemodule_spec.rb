require 'rails_helper'

RSpec.describe Coursemodule, type: :model do
  context 'Association tests' do
    it 'has many internal projects' do
      coursemodule = Coursemodule.reflect_on_association(:internalprojects)
      expect(coursemodule.macro).to eq(:has_many)
    end

    it 'has many projects' do
      coursemodule = Coursemodule.reflect_on_association(:projects)
      expect(coursemodule.macro).to eq(:has_many)
    end

    it 'belongs to users' do
      coursemodule = Coursemodule.reflect_on_association(:user)
      expect(coursemodule.macro).to eq(:belongs_to)
    end
  end

  context 'validation test' do
    user_param = {
      username: 'user1',
      email: 'user1@mail.com'
    }

    it 'should create a valid user' do
      user = User.create(user_param)
      course_param1 = {
        name: 'rails',
        user_id: user.id
      }
      course = Coursemodule.create(course_param1)
      expect(course).to be_valid
    end
  end
end
