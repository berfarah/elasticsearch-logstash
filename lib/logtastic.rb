require "logtastic/version"
require_relative 'logtastic/client'
require_relative 'logtastic/registry'
require_relative 'logtastic/model'

module Logtastic
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
