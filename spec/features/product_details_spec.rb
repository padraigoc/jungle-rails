require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature do
  
    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'
  
      10.times do |n|
        @category.products.create!(
          name:  Faker::Hipster.sentence(3),
          description: Faker::Hipster.paragraph(4),
          quantity: 10,
          price: 64.99
        )
      end
    end

    scenario "User clicks on product" do
      # ACT
      visit root_path
  
      first('article.product').click_link 'Details'
      
      # VERIFY
      expect(page).to have_css 'article.product-detail'
     
    end

end
