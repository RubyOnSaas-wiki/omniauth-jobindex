# Omniauth Jobindex.dk Strategy

Strategy to authenticate with Jobindex.dk via OAuth2 in OmniAuth

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-jobindex'
```

And then execute:

    $ bundle

## Usage

Add following in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :jobindex, ENV['JOBINDEX_CLIENT_ID'], ENV['JOBINDEX_CLIENT_SECRET'],
           scope: 'get_oca_cv'
end
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/RubyOnSaas-wiki/omniauth-jobindex. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the omniauth-jobindex project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/RubyOnSaas-wiki/omniauth-jobindex/blob/master/CODE_OF_CONDUCT.md).
