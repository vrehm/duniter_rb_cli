# frozen_string_literal: true

require_relative '../command'
require_relative './config/network'
require "httparty"

module DuniterRbCli
  module Commands
    class WotList < DuniterRbCli::Command
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
        endpoint = @config.fetch(:base_url) + "wot/members"
        response = HTTParty.get endpoint
        wot_list = response['results']
        wot_list.each_with_index do |wot_member, index|
          puts "#{wot_member['uid']}: #{wot_member['pubkey']}"
        end
        output.puts "OK"
      end
    end
  end
end
