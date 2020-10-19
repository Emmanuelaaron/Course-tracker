require 'rails_helper'

RSpec.describe Internalproject, type: :model do
  it 'belongs to course modules' do
    internalproject = Internalproject.reflect_on_association(:coursemodule)
    expect(internalproject.macro).to eq(:belongs_to)
  end

  it 'belongs to project' do
    internalproject = Internalproject.reflect_on_association(:project)
    expect(internalproject.macro).to eq(:belongs_to)
  end
end
