# frozen_string_literal: true

require_relative '../command'
require_relative './config/network'
require "httparty"

module DuniterRbCli
  module Commands
    class WotCount < DuniterRbCli::Command
      def initialize(options)
        @options = options
        @config = config
        @config.filename = 'network'
        @config.extname = '.yml'
        @config.append_path Dir.pwd
        @config.append_path Dir.home
        if @config.exist?
          @actual_config = @config.read
        else
          puts 'Missing some config'
          DuniterRbCli::Commands::Config::Network.new(options).execute
        end
      end

      def execute(input: $stdin, output: $stdout)
        @config.read
        endpoint = @config.fetch(:base_url) + "wot/members"
        response = HTTParty.get endpoint
        wot_count = response['results'].count
        puts "Wot Members count for #{@config.fetch(:name)}: #{wot_count}"
        output.puts "OK"
      end
    end
  end
end
