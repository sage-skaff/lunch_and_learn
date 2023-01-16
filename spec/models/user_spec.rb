# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many :favorites }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_uniqueness_of :email }
  end

  it 'exists and has attributes' do
    user = User.new(name: 'Ahsoka Tano', email: 'atano@jedi.com', api_key: '000000000')

    expect(user).to be_an_instance_of(User)
    expect(user.name).to eq('Ahsoka Tano')
    expect(user.email).to eq('atano@jedi.com')
    expect(user.api_key).to eq('000000000')
  end
end
