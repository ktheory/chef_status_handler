require 'chef/handler'
require 'net/http'
require 'uri'

module Medidata
  class ChefStatusHandler < Chef::Handler
    attr_accessor :url

    def report
      params = {"chef_report[success]" => success?, "chef_report[node]" => node.name}
      Net::HTTP.post_form(parsed_url, params)
    end

    def parsed_url
      URI.parse url
    end

  end
end

