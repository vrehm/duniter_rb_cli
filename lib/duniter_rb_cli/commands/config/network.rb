# frozen_string_literal: true

require_relative '../../command'
require 'pry-byebug'

module DuniterRbCli
  module Commands
    class Config
      class Network < DuniterRbCli::Command
        def initialize(options)
          @options = options
          @config = config
          @config.filename = 'network'
          @config.extname = '.yml'
          @config.append_path Dir.pwd
          @config.append_path Dir.home
        end

        def execute(input: $stdin, output: $stdout)
          @config.read if @config.exist?
          actual_config = @config.fetch(:name)
          output.puts "Config value: #{actual_config}" unless actual_config.nil?
          user_response = prompt.select("Set G1 or G1-test:", %w(G1-test G1))
          @config.set :name, value: user_response
          @config.write(force: true)
          output.puts "Value successfully set to: #{@config.fetch(:name)}"
        end
      end
    end
  end
end
