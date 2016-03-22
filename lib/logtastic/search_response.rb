require_relative 'response'

module Logtastic
  class SearchResponse < Response
    include Enumerable

    def initialize(raw_json, index = nil)
      super
      @body = map_model_for(index)
    end

    def total
      response.hits.total
    end

    def each
      body.each { |e| yield e }
    end

    private

    def map_model_for(index)
      response.hits.hits.map(&Registry.model_for(index).method(:new))
    end
  end
end
