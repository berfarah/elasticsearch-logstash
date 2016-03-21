require 'json'

SAMPLE_RESPONSE = JSON.parse File.read(
  File.expand_path('../sample_response.json', __FILE__)
).freeze
