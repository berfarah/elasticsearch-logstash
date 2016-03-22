require_relative 'response'

module Logtastic
  class SingleResponse < Response
    def initialize(raw_json, index = nil)
      super
      @body = model_for(index)
    end

    private

    def model_for(index)
      Registry.model_for(index).new(response)
    end
  end
end
