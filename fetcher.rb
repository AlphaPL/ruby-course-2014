require 'nokogiri'
require "open-uri"
require 'net/http'
require 'net/https'

class FetchSource
  def self.fetch_source(n)
      uri = URI.parse("https://zapisy.ii.uni.wroc.pl/news/?page=#{n}")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      request = Net::HTTP::Get.new(uri.request_uri)
      #This makes the request
      resp = http.request(request)
      resp.body
  end
end
