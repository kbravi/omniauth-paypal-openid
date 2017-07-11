# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-paypal-openid/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-paypal-openid"
  spec.version       = OmniAuth::PayPalOpenID::VERSION
  spec.authors       = ["Karthik Ravichandran"]
  spec.email         = ["kb1990@gmail.com"]

  spec.summary       = %q{PayPal Identity strategy for OmniAuth}
  spec.homepage      = "https://github.com/kbravi/omniauth-paypal-openid"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'omniauth', '>= 1.1.1'
  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1.3.1'

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
