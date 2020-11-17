require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "Should not create with no name" do
      @category = Category.new
      @product = @category.products.new
      @product.name = nil
      @product.price = 1000
      @product.quantity = 1
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "Should not create with no price" do
      @category = Category.new
      @product = @category.products.new
      @product.name = 'book name'
      @product.price = nil
      @product.quantity = 2
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "Should not create with no quantity" do
      @category = Category.new
      @product = @category.products.new
      @product.name = 'book name'
      @product.price = 1000
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "Should not create with no category" do
      @category = Category.new
      @product = @category.products.new
      @product.name = 'book name'
      @product.price = 1000
      @product.quantity = 2
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end