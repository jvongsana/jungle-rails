require 'rails_helper'

RSpec.feature "Product detail page", type: :feature, js: true do
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

  scenario "They see all products" do
    visit root_path

    click_on('Details', match: :first)

    expect(page).to have_css 'article.product-detail', count: 1
    expect(page).to have_css 'img.main-img', count: 1
  end
end
