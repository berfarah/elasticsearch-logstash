require 'forwardable'
require 'json'

module Elasticsearch
  module Logstash
    class Model
      extend Forwardable

      class << self
        def delegate(*attributes, expose: true)
          expose(*attributes) if expose
          def_delegators :_source, *attributes
        end

        def expose(*attributes)
          @expose ||= []
          @expose += attributes
        end

        def exposed
          @expose ||= []
        end
      end

      def initialize(raw)
        @raw = raw
      end

      def exposed
        self.class.exposed.each_with_object({}) { |e, h| h[e] = public_send(e) }
      end

      def_delegator :@raw, :_id, :id
      def_delegator :@raw, :_source
      def_delegator :_source, :@timestamp, :timestamp
      delegate :message

      def as_json(*)
        { id: id, timestamp: timestamp }.merge(exposed)
      end

      def to_json(*)
        as_json.to_json
      end
    end
  end
end
