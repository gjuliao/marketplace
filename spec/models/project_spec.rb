require 'rails_helper'

RSpec.describe Project, type: :model do

  let(:user) do
    User.create!({
      username: 'frank1100909asdf',
      fullname: 'Frank Gator',
      email: 'frank@gmail.com'
    })
  end

  it 'Created a new project' do
    project = Project.new({
      name: 'Python',
      built_with: 'python',
      description: 'This is a python game',
      url: 'www.google.com',
      price: 30.0,
      owner_id: user.id
    })
    expect(project.valid?).to be(true)
  end

  it 'Project requires presence of name' do
    project = Project.new({
      built_with: 'python',
      description: 'This is a python game',
      url: 'www.google.com',
      price: 30.0,
      owner_id: user.id
    })
    expect(project.valid?).to be(false)
  end

  it 'Requires presence of built_with' do
    project = Project.new({
      name: 'Python',
      description: 'This is a python game',
      url: 'www.google.com',
      price: 30.0,
      owner_id: user.id
    })
    expect(project.valid?).to be(false)
  end

  it 'Project requires description' do
    project = Project.new({
      name: 'Python',
      built_with: 'python',
      url: 'www.google.com',
      price: 30.0,
      owner_id: user.id
    })
    expect(project.valid?).to be(false)
  end

  it 'Requires presence of url' do
    project = Project.new({
      name: 'Python',
      built_with: 'python',
      description: 'This is a python game',
      price: 30.0,
      owner_id: user.id
    })
    expect(project.valid?).to be(false)
  end

  it 'Requires presence of price' do
    project = Project.new({
      name: 'Python',
      built_with: 'python',
      description: 'This is a python game',
      url: 'www.google.com',
      owner_id: user.id
    })
    expect(project.valid?).to be(false)
  end

  it 'Requires presence of owner' do
    project = Project.new({
      name: 'Python',
      built_with: 'python',
      description: 'This is a python game',
      url: 'www.google.com',
      price: 30.0,
    })
    expect(project.valid?).to be(false)
  end

  
end
