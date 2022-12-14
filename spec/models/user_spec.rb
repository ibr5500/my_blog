require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.create(name: 'Anything', photo: 'http://twitter.com', bio: 'test for User')

  describe 'Tests for User model validations' do
    it 'is valid' do
      expect(user).to be_valid
    end

    it 'is not valid if posts_counter less than zero' do
      user.posts_counter = -1
      expect(user).to_not be_valid
    end

    it 'is not valid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end
  end
end
