require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  describe 'Validations' do

    it 'should save successfully with all validations' do
      @category = Category.find_or_create_by! name: 'test'
      @product = @category.products.new({
        name:  'Test item',
        quantity: 10,
        price: 64.99
      })
      expect(@product.save).to be true
    end

    it 'should not save due to missing category' do
      @product = Product.create({
        name:  nil,
        quantity: 10,
        price: 64.99
      })
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

    it 'should not save due to missing name' do
      @category = Category.find_or_create_by! name: 'test'
      @product = @category.products.new({
        name:  nil,
        quantity: 10,
        price: 64.99
      })
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save due to missing quantity value' do
      @category = Category.find_or_create_by! name: 'test'
      @product = @category.products.new({
        name:  'Test item',
        quantity: nil,
        price: 64.99
      })
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save due to missing price' do
      @category = Category.find_or_create_by! name: 'test'
      @product = @category.products.new({
        name:  'Test item',
        quantity: 10,
        price: nil
      })
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end


  end
end
