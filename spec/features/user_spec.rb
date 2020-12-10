require 'rails_helper'

RSpec.describe User, type: :model do
    
    it 'is not valid if email is not provided' do
        expect(User.create(username: 'thisisatest')).to_not be_valid
    end

    it 'is not valid if username is not provided' do
        expect(User.create(email: 'thisisatest@test.com')).to_not be_valid
    end
    
    it 'is valid if email and username are provided' do
        expect(User.create(username: 'thisisatest', email: 'test@t.com')).to be_valid
    end
end