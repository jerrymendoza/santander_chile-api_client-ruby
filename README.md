# Santander Chile Ruby API Client

Unofficial Client for Santander Bank Chile API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'santander_chile-api_client'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install santander_chile-api_client

## Usage
### Configuration
```rb
client = SantanderChile::ApiClient::Client.new do |config|
    config.client_id = '<CLIENT_ID>'
end
```

### Login
```rb
client.login(
    username: "00123456781", #12.345.678-1
    password: "XXXX",
    )
```

### Resources

#### Products (accounts)
```rb
results = client.products
#=> SantanderChile::ApiClient::Collection

results.each { |x| x }
#=> <SantanderChile::ApiClient::Account>
#=> <SantanderChile::ApiClient::Account:>
#=> <SantanderChile::ApiClient::Account>

account = result.first
#=> <SantanderChile::ApiClient::Account>

```
#=> SantanderChile::ApiClient::Collection

results.data
#=> [#<SantanderChile::ApiClient::Account>, #<SantanderChile::ApiClient::Account:>]
```
### Todo
- [x] ~~Products (accounts)~~
- [ ] Balance
- [ ] Transactions
- [ ] Transfers
- [ ] Payments

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/santander_chile-api_client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/santander_chile-api_client/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SantanderChile::ApiClient project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/santander_chile-api_client/blob/master/CODE_OF_CONDUCT.md).
