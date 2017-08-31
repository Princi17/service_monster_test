require 'spec_helper'
require 'byebug'

RSpec.describe ServiceMonster::Client do

  it 'should connect using the configured endpoint and api version' do
    byebug
    client = ServiceMonster::Client.new
    endpoint = URI.parse("#{client.endpoint}#{client.api_version}/")
    connection = client.send(:connection).build_url(nil).to_s
    expect(connection).to eq(endpoint.to_s)
  end

end
