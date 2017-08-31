module ServiceMonster
  module Response
    def self.create(response_hash)
      data = response_hash.data.dup rescue response_hash
      data.extend(self)
      return data
    end
  end
end
