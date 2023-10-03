require 'rails_helper'

RSpec.describe 'User', type: :model do

    it 'validates User creation working' do
        user = User.create!({
            username: 'frank101asdfasdf',
            fullname: 'Frank Gator',
            email: 'frank@gmail.com'
        })
        expect(user.valid?).to be(true)
    end

    it 'validates User username to be present' do
        user = User.new({
            fullname: 'Frank Gator',
            email: 'frank@gmail.com'
        })
        expect(user.valid?).to be(false)
    end

    it 'validates User fullname to be present' do
        user = User.new({
            username: 'frank10',
            email: 'frank@gmail.com'
        })
        expect(user.valid?).to be(false)
    end

    it 'validates User email to be present' do
        user = User.new({
            username: 'frank10',
            fullname: 'Frank Gator',
        })
        expect(user.valid?).to be(false)
    end

    it 'validates User username uniqueness' do
        user = User.create({
            username: 'frank10asdfasdfsdf',
            fullname: 'Frank Gator',
            email: 'frank@gmail.com'
        })

        user1 = User.create({
            username: 'frank10asdfasdfsdf',
            fullname: 'Frank Gator',
            email: 'frank@gmail.com'
        })
        expect(user1).to be_invalid
    end
    
end