require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is invalid without name' do
    user = User.new
    user.valid?
    expect(user.errors[:name]).to include(nil)
  end
end
