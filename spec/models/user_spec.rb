require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do

    it 'should save user with required validations' do
      @user = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'joendoe@example.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      })
      expect(@user.save).to be true
    end

    it 'should not save user due to unmatched passwords' do
      @user = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'joendoe@example.com',
        password: 'testpass',
        password_confirmation: 'pass'
      })

      expect(@user.save).to be false
    end

    it 'should not save user due to existing email' do
      @userA = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'JONDOE@example.COM',
        password: 'testpass',
        password_confirmation: 'testpass'
      })

      @userB = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'jondoe@EXAMPLE.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      })

      expect(@userA.save).to be true
      expect(@userB.save).to be false
    end

    it 'should not save user due to missing email' do
      @user = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: nil,
        password: 'testpass',
        password_confirmation: 'testpass'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should not save user due to missing first name' do
      @user = User.new({
        first_name:  nil,
        last_name: 'Doe',
        email: 'jondoe@EXAMPLE.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      })
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should not save user due to missing email' do
      @user = User.new({
        first_name:  'Jon',
        last_name: nil,
        email: 'jondoe@EXAMPLE.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end


  end

end
