# location: spec/feature/integration_spec.rb
require 'rails_helper'


RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Yue Hu'
    fill_in 'Price', with: 2000
    select '2021', :from => 'book_published_date_1i'
    select 'December', :from => 'book_published_date_2i'
    select '30', :from => 'book_published_date_3i'

    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('Yue Hu')
    expect(page).to have_content('2000')
    expect(page).to have_content('2021-12-30')
  end
end

RSpec.describe 'Deleting a book', type: :feature do
  scenario 'valid inputs' do

    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Yue Hu'
    fill_in 'Price', with: 2000
    select '2021', :from => 'book_published_date_1i'
    select 'December', :from => 'book_published_date_2i'
    select '30', :from => 'book_published_date_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    click_on 'Destroy'

    expect(page).not_to have_content('harry potter')
  end
end

RSpec.describe 'Updating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Yue Hu'
    fill_in 'Price', with: 2000
    select '2021', :from => 'book_published_date_1i'
    select 'December', :from => 'book_published_date_2i'
    select '30', :from => 'book_published_date_3i'
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('Yue Hu')
    expect(page).to have_content('2021-12-30')
    expect(page).to have_content('2000')

    click_on 'Edit'
    select '2018', :from => 'book_published_date_1i'
    select 'December', :from => 'book_published_date_2i'
    select '30', :from => 'book_published_date_3i'
    fill_in 'Author', with: 'Jasson Hu'
    fill_in 'Price', with: 1800
    click_on 'Update Book'
    visit books_path
    expect(page).to have_content('Jasson Hu')
    expect(page).to have_content('2018-12-30')
    expect(page).to have_content('1800')
  end
end

RSpec.describe 'Showing a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Yue Hu'
    fill_in 'Price', with: 2000
    select '2021', :from => 'book_published_date_1i'
    select 'December', :from => 'book_published_date_2i'
    select '30', :from => 'book_published_date_3i'
    click_on 'Create Book'
    visit books_path
    click_on 'Show'
    expect(page).to have_content('harry potter')
  end
end

