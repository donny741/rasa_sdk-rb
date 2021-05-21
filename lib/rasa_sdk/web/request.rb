# frozen_string_literal: true

module RasaSDK
  module Web
    module Request
      def get(path, options = {})
        request(:get, path, options)
      end

      def post(path, options = {})
        request(:post, path, options)
      end

      def put(path, options = {})
        request(:post, path, options)
      end

      private

      def request(method, path, options)
        response = connection.public_send(method, path) do |request|
          request.params = options[:params] if options[:params]
          request.body = options[:body] if options[:body]
        end

        JSON.parse(response.body, symbolize_names: true)
      end
    end
  end
end
