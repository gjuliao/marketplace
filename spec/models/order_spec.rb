require 'rails_helper'

RSpec.describe Order, type: :model do
  
  let(:user) do
    User.create!({
      username: 'frank1100909as',
      fullname: 'Frank Gator',
      email: 'frank@gmail.com'
    })
  end

  let(:project) do
    Project.create!({
      name: 'Python',
      built_with: 'python',
      description: 'This is a python game',
      url: 'www.google.com',
      price: 30.0,
      owner_id: user.id
    })
  end

    it 'describe order created succesfully' do
      order = Order.create!({
        fee: 10,
        value:20,
        project_id: project.id,
        client_id: user.id
      })
      expect(order.valid?).to be(true)
  end

  it 'Presence of fee' do
    order = Order.new({
      value:20,
      project_id: project.id,
      client_id: user.id
    })
    expect(order.valid?).to be(false)
end

it 'Presence of value' do
  order = Order.new({
    fee: 10,
    project_id: project.id,
    client_id: user.id
  })
  expect(order.valid?).to be(false)
end

end
