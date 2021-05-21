module RasaSDK
  module Events
    class SlotSet < Base
      def run(name:, value: nil, timestamp: nil)
        { event: 'slot', timestamp: timestamp, name: name, value: value }
      end
    end
  end
end
