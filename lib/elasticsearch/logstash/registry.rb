require_relative 'model'

module Elasticsearch
  module Logstash
    module Registry
      RESPONSE_MODELS = Hash.new { Model }

      module_function

      def model_for(index)
        RESPONSE_MODELS[index]
      end

      def add(klass, index)
        RESPONSE_MODELS[index] = klass
      end

      def remove(index)
        RESPONSE_MODELS.delete(index)
      end
    end
  end
end
