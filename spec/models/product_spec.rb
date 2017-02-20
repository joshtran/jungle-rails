require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do

    it 'should have all validations met' do
      @category = Category.find_or_create_by! name: 'test'
      @product = @category.products.create!({
        name:  'Test item',
        quantity: 10,
        price: 64.99
      })
      expect(@product.category).to be_present
      expect(@product.category).to be_present
      expect(@product.category).to be_present
      expect(@product.category).to be_present
    end

    it 'should have a category' do
      @category = nil
      @product = @category.products.create!({
        name:  nil,
        quantity: 10,
        price: 64.99
      })
      expect(@product.category).to be_present
    end

    it 'should have a name' do
      @category = Category.find_or_create_by! name: 'test'
      @product = @category.products.create!({
        name:  nil,
        quantity: 10,
        price: 64.99
      })
      expect(@product.name).to be_present
    end

    it 'should have quantity value' do
      @category = Category.find_or_create_by! name: 'test'
      @product = @category.products.create!({
        name:  'Test item',
        quantity: nil,
        price: 64.99
      })
      expect(@product.quantity).to be_present
    end

    it 'should have a price' do
      @category = Category.find_or_create_by! name: 'test'
      @product = @category.products.create!({
        name:  'Test item',
        quantity: 10,
        price: nil
      })
      expect(@product.price).to be_present
    end


  end
end
