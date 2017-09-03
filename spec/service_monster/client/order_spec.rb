require 'spec_helper'
require 'byebug'

RSpec.describe ServiceMonster::Client::Orders do

  before do
    @client = ServiceMonster.client({api_key: "Q0xfQVBJVVNFUjoyYnNtYkU1ZjJONHNOUGo="})
  end

  describe "GET #orders" do
    it "returns a success response" do
      response = @client.orders
      expect(response).to be_an_instance_of(Hash)
      expect(response['items']).to be_an_instance_of(Array)
    end

    it "returns orders after certain date" do
      response = @client.orders({wField: "createdOn", wOperator: 'gt', wValue: "2015-03-20"})
      expect(response).to be_an_instance_of(Hash)
      expect(response['items']).to be_an_instance_of(Array)
    end

    it "returns orders of certain date" do
      response = @client.orders({wField: "createdOn", wOperator: 'eq', wValue: "2015-03-21"})
      expect(response).to be_an_instance_of(Hash)
      expect(response['items']).to be_an_instance_of(Array)
    end


    it "returns empty array of orders if date is not present" do
      response = @client.orders({wField: "createdOn", wOperator: 'gt', wValue: "2016-03-20"})
      expect(response['items']).to be_empty
    end

    it "not returns orders if order of that corresponding date is not availables" do
      response = @client.orders({wField: "createdOn", wOperator: 'eq', wValue: "2015-03-23"})
      expect(response).to be_an_instance_of(Hash)
      expect(response['items']).to be_empty
    end

    it "returns orders on basis of limit and page" do
      response = @client.orders({limit: 1, page: 1 })
      expect( response["items"].count).to eq(1)
    end

    it "will not returns orders on basis of page" do
      response = @client.orders({page: 1})
      expect(response['items']).to be_empty
    end
  end

  describe "GET #order" do
    it "returns a order corresponding to particular id" do
      response = @client.order("5a209c1b-cfa6-11e4-b64c-edc3386bc6c1")
      expect(response).to be_an_instance_of(Hash)
    end
  end



end
