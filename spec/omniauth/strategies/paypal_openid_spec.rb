require "spec_helper"

describe OmniAuth::Strategies::PayPalOpenID do
  subject do
    OmniAuth::Strategies::PayPalOpenID.new(nil, @options || {})
  end

  describe '#client options' do
    it 'has correct PayPal site' do
      expect(subject.client.site).to eq('https://api.paypal.com')
    end

    it 'has correct PayPal sandbox site' do
      @options = { :sandbox => true }
      subject.setup_phase
      expect(subject.client.site).to eq('https://api.sandbox.paypal.com')
    end

    it 'has correct authorize url' do
      expect(subject.client.options[:authorize_url]).to eq('https://www.paypal.com/webapps/auth/protocol/openidconnect/v1/authorize')
    end

    it 'has correct sandbox authorize url' do
      @options = { :sandbox => true }
      subject.setup_phase
      expect(subject.client.options[:authorize_url]).to eq('https://www.sandbox.paypal.com/webapps/auth/protocol/openidconnect/v1/authorize')
    end

    it 'has correct token url' do
      expect(subject.client.options[:token_url]).to eq('/v1/identity/openidconnect/tokenservice')
    end

    it 'runs the setup block if passed one' do
      counter = ''
      @options = { :setup => Proc.new { |env| counter = 'ok' } }
      subject.setup_phase
      expect(counter).to eq("ok")
    end
  end

  describe '#client' do
    it 'should be initialized with symbolized client_options' do
      @options = { :client_options => { 'authorize_url' => 'https://example.com' } }
      expect(subject.client.options[:authorize_url]).to eq('https://example.com')
    end
  end

  describe '#authorize_params' do
    it 'should include any authorize params passed in the :authorize_params option' do
      @options = { :authorize_params => { :foo => 'bar', :baz => 'zip' } }
      expect(subject.authorize_params['foo']).to eq('bar')
      expect(subject.authorize_params['baz']).to eq('zip')
    end

    it 'should include top-level options that are marked as :authorize_options' do
      @options = { :authorize_options => [:scope, :foo], :scope => 'bar', :foo => 'baz' }
      expect(subject.authorize_params['scope']).to eq('bar')
      expect(subject.authorize_params['foo']).to eq('baz')
    end
  end

  describe 'redirect_uri' do
    it 'should default to nil' do
      @options = {}
      expect(subject.authorize_params['redirect_uri']).to eq(nil)
    end

    it 'should set the redirect_uri parameter if present' do
      @options = { redirect_uri: 'https://example.com' }
      expect(subject.authorize_params['redirect_uri']).to eq('https://example.com')
    end
  end

  describe '#callback_path' do
    it "has the correct callback path" do
      expect(subject.callback_path).to eq('/auth/paypal_openid/callback')
    end

    it 'should set the callback_path parameter if present' do
      @options = { callback_path: '/auth/foo/callback' }
      expect(subject.callback_path).to eq('/auth/foo/callback')
    end
  end
end
