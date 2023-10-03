require 'rails_helper'

RSpec.describe Project, type: :model do
  it 'Created a new project' do
    user = User.create!({
      username: 'frank1100909asdf',
      fullname: 'Frank Gator',
      email: 'frank@gmail.com'
  })

    project = Project.create!({
      name: 'Python',
      built_with: 'python',
      description: 'This is a python game',
      url: 'www.google.com',
      price: 30.0,
      owner_id: user.id
    })
    expect(project.valid?).to be(true)
  end
end
