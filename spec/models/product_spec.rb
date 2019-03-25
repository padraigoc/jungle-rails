require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    it 'returns true when name is present' do
    @product = Product.new
    @product.name = "iPhone"
   
    expect(@product.name).to be_present
    end

    it 'returns true when price is present' do
      @product = Product.new
      @product.price = "12345678"
      
      expect(@product.price).to be_present
      end

      it 'returns true when quantity is present' do
        @product = Product.new
        @product.quantity = "123456"
        
        expect(@product.quantity).to be_present
        end

        it 'returns true when category is present' do
          @product = Product.new
          @product.category = Category.create!(name: "Categoreyey")
 
          expect(@product.category).to be_present
          end
  end


end
