# FlowCl

Wrapper to use [Flow API REST](https://www.flow.cl/docs/api.html) in Ruby

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flow_cl'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install flow_cl

## Usage

```ruby
require 'flow_cl'

api_key = 'MY_SUPER_SECRET_API_KEY'
secret_key = 'MY_SUPER_SECRET_SECRET_KEY'

# For production, set sandbox option to false
client = FlowCl::Client.new(api_key, secret_key, { logger: false, sandbox: true })
```

## Documentation

Please read the documentation [here](https://www.rubydoc.info/gems/flow_cl/1.0.0) and [here](https://www.flow.cl/docs/api.html)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ronzalo/flow_cl. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ronzalo/flow_cl/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the FlowCl project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/flow_cl/blob/master/CODE_OF_CONDUCT.md).
