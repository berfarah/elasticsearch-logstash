# Elasticsearch::Logstash

This is a gem to allow you to more easily communicate with your Elasticsearch
index of Logstash messages, using their default schema.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'elasticsearch-logstash', git: "git@github.com:berfarah/elasticsearch-logstash.git"
```

And then execute:

    $ bundle


## Usage

You can use the client to `#search` pretty much in the same way you would use
Elasticsearch::Client

```rb
client = Elasticsearch::Logstash.client.new(host: ENV.fetch('ELASTICSEARCH_HOST'))
client.search(index: :my_index, q: "term:foo")
```

The function of this gem, however, is how you handle the response. The default
model for responses exposes `id`, `timestamp` and `message` to `#as_json`. It
grabs `timestamp` and `message` from the `"_source"` attribute in the Elasticsearch
response.

You can `delegate`, `expose` and `hide` methods in a `Elasticsearch::Logstash::Model`:

```rb
class Car < Elasticsearch::Logstash::Model
  # fetches from "_source": { "passengers" => 5 }
  # creates the #passengers method
  # exposes :passengers in #as_json
  delegate :passengers

  # It will not expose attributes to #as_json if you ask it not to
  delegate :employee_pricing, expose: false

  # fetches from a local method
  # exposes :my_method in #as_json
  expose :cost_per_passenger

  def cost_per_passenger
    price / passengers
  end
end

# You need to register your model for it to automatically be handled
Elasticsearch::Logstash::Registry.add(Car, :car)

# Now any time you search the index `car`, it will be handled by the Car model.
client.search(index: :cars, q: "passengers:4")  # => Response[Car]
client.get(index: :cars, type: :car, id: 2)     # => Response[Car]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/berfarah/elasticsearch-logstash. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
