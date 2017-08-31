module ServiceMonster
  class Client
    module Orders
      require "byebug"

      def orders(options = {})
        b
        response = get("orders", options)
        if options["createdOn"].present?
          response = response["items"].select{|hash| hash["createdOn"] = options["createdOn"]}
        end
        response
      end

      def order(id, options = {})
        response = get("orders/#{id}", options)
      end
    end
    include Orders
  end
end
