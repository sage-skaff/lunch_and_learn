# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Image do
  it 'exists' do
    data = {
      alt_description: 'people walking on bridge over body of water during daytime',
      urls: { raw: 'https://images.unsplash.com/photo-1580327942498-53a877c6d0ce?ixid=MnwzOTkxNTB8MHwxfHJhbmRvbXx8fHx8fHx8fDE2NzM3NTY0MDQ&ixlib=rb-4.0.3' }
    }

    image = Image.new(data)
    expect(image).to be_an_instance_of(Image)
  end
end
