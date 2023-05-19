# frozen_string_literal: true

require 'net/http'
require 'addressable'

module Ipgeobase
  class HttpClient
    def initialize(host)
      @host = host
    end

    def get(ip)
      uri = build_uri(ip)
      Net::HTTP.get(uri)
    end

    private

    def build_uri(ip)
      Addressable::URI.parse("http://#{@host}/xml/#{ip}")
    end
  end
end
