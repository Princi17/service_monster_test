module ServiceMonster
  class Client
    module Jobs
      require "byebug"

      def jobs(options = {})
        response = get("jobs", options)
        byebug
        if options["timeStamp"].present?
          response = response["items"].select{|hash| hash["timeStamp"] = options["timeStamp"]}
        end
        response
      end

      def job(id, options = {})
        response = get("jobs/#{id}", options)
      end
    end
    include Jobs
  end
end
