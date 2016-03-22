$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
SimpleCov.start { add_filter '_spec' }

require 'logtastic'
require_relative 'support/sample_response'
