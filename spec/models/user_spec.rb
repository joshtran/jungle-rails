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

    it 'should not save user due to missing password' do
      @user = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'jondoe@EXAMPLE.com',
        password: nil,
        password_confirmation: 'testpass'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should not save user due to missing password confirmation' do
      @user = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'jondoe@EXAMPLE.com',
        password: 'testpass',
        password_confirmation: nil
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

     it 'should not save user due password length' do
      @user = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'jondoe@EXAMPLE.com',
        password: 'pw',
        password_confirmation: 'pw'
      })
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end

  end

  describe '.authenticate_with_credentials' do

    it 'should return an instance of the user if authenticated' do

      @user = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'jondoe@example.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      })
      @user.save
      @authenticated_user = User.authenticate_with_credentials('jondoe@example.com', 'testpass')

      expect(@authenticated_user).to be_present

    end

    it 'should not return an instance of the user if authentication fails' do

      @user = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'jondoe@example.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      })
      @user.save
      @authenticated_user = User.authenticate_with_credentials('jondoe@example.com', 'pass')

      expect(@authenticated_user).to be_nil

    end

    it 'should return an instance of the user even if there are extra spaces in the email' do

      @user = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'jondoe@example.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      })
      @user.save
      @authenticated_user = User.authenticate_with_credentials(' jondoe@example.com ', 'testpass')

      expect(@authenticated_user).to be_present

    end

    it 'should return an instance of the user even if the wrong case is used for their email' do

      @user = User.new({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'jondoe@example.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      })
      @user.save
      @authenticated_user = User.authenticate_with_credentials(' jonDOE@example.COM ', 'testpass')

      expect(@authenticated_user).to be_present

    end


  end

end
