require 'json'
require 'hashie'
require_relative 'registry'

module Logtastic
  class ResponseWrapper < Hashie::Mash
  end

  class Response
    attr_reader :raw_json, :response, :body
    alias_method :to_s, :raw_json

    def initialize(raw_json, index = nil)
      @raw_json = raw_json
      @response = ResponseWrapper.new raw_json
    end

    def as_json(*)
      body
    end

    def to_json(*)
      as_json.to_json
    end
  end
end
