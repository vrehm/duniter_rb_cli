# frozen_string_literal: true

require_relative '../command'
require_relative './config/network'

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
          @config.read
        else
          puts 'Missing some config'
          DuniterRbCli::Commands::Config::Network.new(options).execute
        end
        @actual_config = @config.read
      end

      def execute(input: $stdin, output: $stdout)
        # Command logic goes here ...
        output.puts "OK"
      end
    end
  end
end
