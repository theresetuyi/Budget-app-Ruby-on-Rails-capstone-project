require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:example) do
    @current = User.create(name: 'Theddy', email: 'test@gmail.com', password: 'pw1234')
  end
  subject { Category.new(name: 'transactions', icon: 'https://images.unsplash.com/photo-1535043934128-cf0b28d52f95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8d29tZW4lMjBzaG9lc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80', user_id: @current.id) }

  before { subject.save }

  it 'displays a list of transactions for a category' do
    subject.name = 'transactions'
    expect(subject).to be_valid
  end

  it 'Icon is valid' do
    subject.icon = 'https://images.unsplash.com/photo-1535043934128-cf0b28d52f95?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8d29tZW4lMjBzaG9lc3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'
    expect(subject).to be_valid
  end

  it 'Author is required' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end

  it 'Author should exist' do
    subject.user_id = 10
    expect(subject).to_not be_valid
  end
end
