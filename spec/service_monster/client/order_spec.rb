require 'spec_helper'
require 'byebug'

RSpec.describe ServiceMonster::Client::Orders do

  before do
    @client = ServiceMonster::Client.new
    @endpoint = URI.parse("#{client.endpoint}#{client.api_version}/")
    @connection = client.send(:connection).build_url(nil).to_s
  end

  describe "GET #orders" do
    it "returns a success response" do
      byebug
      response = JSON.parse(@client.orders)

      expect(response).to be_an_instance_of(Hash)
      expect(response['items']).to be_an_instance_of(Array)
      expect(response['items'].size).to > 0
    end
  end

end