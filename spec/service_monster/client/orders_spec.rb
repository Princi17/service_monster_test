require 'spec_helper'
require 'byebug'

RSpec.describe ServiceMonster::Order do

  it 'should connect using the configured endpoint and api version' do
    order = ServiceMonster::Order.new
    endpoint = URI.parse("#{order.endpoint}#{order.api_version}/")
    connection = order.send(:connection).build_url(nil).to_s
    expect(connection).to eq(endpoint.to_s)
  end

  describe "GET #orders" do
    it "returns a success response" do
      byebug
      ServiceMonster::Client::Orders.orders(createdOn: "2015-03-19T15:36:00")
      # widget = FactoryGirl.create(:widget)
      # expect(response.status).to eq(200)
    end
  end

end
