require "elasticsearch/logstash/version"
require_relative 'logstash/client'
require_relative 'logstash/registry'
require_relative 'logstash/model'

module Elasticsearch
  module Logstash
    module_function

    def client(*args)
      Client.new(*args)
    end

    def registry
      Registry
    end

    def model
      Model
    end
  end
end
