# Omniauth PayPal OpenID

This gem contains the Log In With PayPal OpenID strategy for OmniAuth.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-paypal-openid'
```

And then execute:
```
$ bundle
```

Or install it yourself as:
```
$ gem install omniauth-paypal-openid
```

## Usage


Here's a quick example, adding the middleware to a Rails app in `config/initializers/omniauth.rb`.

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :paypal_openid, ENV['APP_ID'], ENV['APP_TOKEN'], sandbox: true, scope: "openid profile email"
end
```

## Attributes and Scopes

Log In With PayPal information can be found on https://developer.paypal.com/webapps/developer/docs/integration/direct/log-in-with-paypal/

The possible attributes to be returned at the moment are:

```ruby
info['name']
info['email']
info['first_name']
info['last_name']
info['location']
info['name']
info['phone']

extra['raw_info']['account_creation_date']
extra['raw_info']['account_type']
extra['raw_info']['address']['country']
extra['raw_info']['address']['locality']
extra['raw_info']['address']['postal_code']
extra['raw_info']['address']['region']
extra['raw_info']['address']['street_address']
extra['raw_info']['language']
extra['raw_info']['locale']
extra['raw_info']['verified_account']
extra['raw_info']['zoneinfo']
extra['raw_info']['age_range']
extra['raw_info']['birthday']
```

The actual set of attributes returned depends on the scopes set. The currently available scopes are:

```
openid
profile
email
address
phone
https://uri.paypal.com/services/paypalattributes
https://uri.paypal.com/services/expresscheckout
```

(those last 2 are scope names, not links)

For more details see the PayPal [list of attributes](https://developer.paypal.com/webapps/developer/docs/integration/direct/log-in-with-paypal/detailed/#attributes).

## Registering for an API key

To register your application for Log In With PayPal head over to the [PayPal Developer portal](https://developer.paypal.com/), log in and register for an application. Make sure to match your scope when registering your app to the scope provided when initializing Omniauth.

## Example of result auth hash
With all scopes requested.

```yaml
provider: paypal
uid: bathjJwvdhKjgfgh8Jd745J7dh5Qkgflbnczd65dfnw
info:
  name: John Smith
  email: example@example.com
  first_name: John
  last_name: Smith
  location: Moscow
  name: John Smith
  phone: "71234567890"
credentials:
  token: <token>
  refresh_token: <refresh token>
  expires_at: 1355082790
  expires: true
extra:
  raw_info:
    account_creation_date: "2008-04-21"
    account_type: PERSONAL
    user_id: https://www.paypal.com/webapps/auth/identity/user/bathjJwvdhKjgfgh8Jd745J7dh5Qkgflbnczd65dfnw
    address:
      country: US
      locality: San Jose
      postal_code: "95131"
      region: CA
      street_address: 1 Main St
    language: en_US
    locale: en_US
    verified_account: true
    zoneinfo: America/Los_Angeles
    age_range: 31-35
    birthday: "1982-01-01"
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/omniauth-paypal-openid. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

