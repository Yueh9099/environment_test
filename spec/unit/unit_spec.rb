# location: spec/unit/unit_spec.rb
require 'rails_helper'

RSpec.describe Book, type: :model do
  subject do
    described_class.new(title: 'harry potter', author: 'Yue Hu', price: 2000, published_date: Date.parse('Dec 8 2015'))
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.title = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid without an author' do
    subject.author = nil
    expect(subject).not_to be_valid
  end
  it 'is not valid with price of 0' do
    subject.price = 0
    expect(subject).not_to be_valid
  end
  it 'is not valid with price less than 0' do
    subject.price = -1
    expect(subject).not_to be_valid
  end
  it 'is not valid without a date' do
    subject.published_date = nil
    expect(subject).not_to be_valid
  end
end