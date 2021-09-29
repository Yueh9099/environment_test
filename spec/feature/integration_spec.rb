# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Yue Hu'
    fill_in 'Price', with: 2000
    fill_in 'Published Date', with: Date.parse("Dec 8 2015")
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('Yue Hu')
    expect(page).to have_content('2000')
    expect(page).to have_content('Date: 2015-12-08')
  end
end

RSpec.describe 'Deleting a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Yue Hu'
    fill_in 'Price', with: 2000
    fill_in 'Published Date', with: Date.parse("Dec 8 2015")
    click_on 'Create Book'
    visit books_path
    click_on 'Destory'
    click_on 'OK'
    visit books_path
    expect(page).to have_content('Book was successfully destroyed.')
  end
end

RSpec.describe 'Updating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Yue Hu'
    fill_in 'Price', with: 2000
    fill_in 'Published Date', with: Date.parse("Dec 8 2015")
    click_on 'Create Book'
    visit books_path
    click_on 'Edit'
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Jasson Hu'
    fill_in 'Price', with: 2000
    fill_in 'Published Date', with: Date.parse("Dec 8 2015")
    click_on 'Update Book'
    visit books_path
    expect(page).to have_content('Jasson Hu')
  end
end

RSpec.describe 'Showing a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Yue Hu'
    fill_in 'Price', with: 2000
    fill_in 'Published Date', with: Date.parse("Dec 8 2015")
    click_on 'Create Book'
    visit books_path
    click_on 'Show'
    expect(page).to have_content('harry potter')
  end
end

