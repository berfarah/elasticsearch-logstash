# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elasticsearch/logstash/version'

Gem::Specification.new do |spec|
  spec.name          = "elasticsearch-logstash"
  spec.version       = Elasticsearch::Logstash::VERSION
  spec.authors       = ["Bernardo Farah"]
  spec.email         = ["ber@bernardo.me"]

  spec.summary       = %q{Get your Logstash resources from Elasticsearch easily}
  spec.description   = %q{Use models to expose attributes and structure your Logstash data}
  spec.homepage      = "https://github.com/berfarah/elasticsearch-logstash"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "elasticsearch", "~> 1.0.14"
  spec.add_dependency "hashie", "~> 3.4.3"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "simplecov", "~> 0.11.2"
  spec.add_development_dependency "rspec"
end
