# frozen_string_literal: true

require 'faraday'

require_relative 'request'
require_relative 'endpoints'

module RasaSDK
  module Web
    class Client
      include Request
      include Endpoints

      def initialize(host:)
        @host = host
      end

      attr_reader :host

      private

      def connection
        @connection ||= Faraday::Connection.new(host)
      end
    end
  end
end
