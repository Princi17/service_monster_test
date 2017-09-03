module ServiceMonster
  module Response
    def self.create(response_hash)
      data = response_hash.to_hash
    end

    attr_reader :pagination
    attr_reader :meta
  end
end
