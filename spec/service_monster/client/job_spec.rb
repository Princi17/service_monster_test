require 'spec_helper'
require 'byebug'

RSpec.describe ServiceMonster::Client::Jobs do

  before do
    @client = ServiceMonster.client({api_key: "Q0xfQVBJVVNFUjoyYnNtYkU1ZjJONHNOUGo="})
  end

  describe "GET #jobs" do
    it "returns a success response" do
      response = @client.jobs
      expect(response).to be_an_instance_of(Hash)
      expect(response['items']).to be_an_instance_of(Array)
    end

    it "returns jobs after certain date" do
      response = @client.jobs({wField: "timeStamp", wOperator: 'gt', wValue: "2015-03-20"})
      expect(response).to be_an_instance_of(Hash)
      expect(response['items']).to be_an_instance_of(Array)
    end
    #
    it "returns jobs of certain date" do
      response = @client.jobs({wField: "timeStamp", wOperator: 'eq', wValue: "2015-03-21"})
      expect(response).to be_an_instance_of(Hash)
      expect(response['items']).to be_an_instance_of(Array)
    end
    #
    #
    it "returns empty array of jobs if date is not present" do
      response = @client.jobs({wField: "timeStamp", wOperator: 'gt', wValue: "2016-03-20"})
      expect(response['items']).to be_empty
    end

    it "not returns jobs if order of that corresponding date is not availables" do
      response = @client.jobs({wField: "timeStamp", wOperator: 'eq', wValue: "2015-03-23"})
      expect(response).to be_an_instance_of(Hash)
      expect(response['items']).to be_empty
    end

    it "returns jobs on basis of limit and page" do
      response = @client.jobs({limit: 1, page: 1 })
      expect( response["items"].count).to eq(1)
    end

    it "will not returns jobs on basis of page" do
      response = @client.jobs({page: 1})
      expect(response['items']).to be_empty
    end
  end

  describe "GET #job" do
    it "returns a order corresponding to particular id" do
      response = @client.job("8a8d5814-cfa6-11e4-b64c-edc3386bc6c1")
      expect(response).to be_an_instance_of(Hash)
    end
  end



end
