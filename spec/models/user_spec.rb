require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do

    it 'should have required validations' do
      @user = User.create!({
        first_name:  'Jon',
        last_name: 'Doe',
        email: 'joendoe@example.com',
        password: 'testpass',
        password_confirmation: 'testpass'
      })

      expect(@user.first_name).to be_present
      expect(@user.last_name).to be_present
      expect(@user.email).to be_present
      expect(@user.password).to be_present
      expect(@user.password_confirmation).to be_present





    end


  end

end
