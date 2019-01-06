# frozen_string_literal: true

require_relative '../../command'

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
          @config.read if @config.exist?
          @actual_config = @config.fetch(:name)
        end

        def execute(input: $stdin, output: $stdout)
          output.puts "Config value: #{@actual_config}" unless @actual_config.nil?
          user_response = prompt.select("Set G1 or G1-test:", %w(G1-test G1))
          @config.set :name, value: user_response
          user_response == "G1" ?
            @config.set(:base_url, value: "https://g1.duniter.org/") :
            @config.set(:base_url, value: "https://g1-test.duniter.org/")
          @config.write(force: true)
          output.puts "Value successfully set to: #{@config.fetch(:name)}"
          output.puts "Base url: #{@config.fetch(:base_url)}"
        end
      end
    end
  end
end
