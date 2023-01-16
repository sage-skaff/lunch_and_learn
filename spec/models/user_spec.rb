# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
    it 'exists and has attributes' do
        user = User.new(name: 'Ahsoka Tano', email: 'atano@jedi.com', api_key: '000000000')

        expect(user).to be_an_instance_of(User)
        expect(user.name).to eq('Ahsoka Tano')
        expect(user.email).to eq('atano@jedi.com')
        expect(user.api_key).to eq('000000000')
    end
end