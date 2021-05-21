# frozen_string_literal: true

module RasaSDK
  module Events
    class Base
      def self.run(**kwargs)
        new.run(**kwargs)
      end
    end
  end
end
