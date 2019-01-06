# frozen_string_literal: true

require 'thor'

module DuniterRbCli
  # Handle the application command line parsing
  # and the dispatch to various command objects
  #
  # @api public
  class CLI < Thor
    # Error raised by this runner
    Error = Class.new(StandardError)

    desc 'version', 'duniter_rb_cli version'
    def version
      require_relative 'version'
      puts "v#{DuniterRbCli::VERSION}"
    end
    map %w(--version -v) => :version

    require_relative 'commands/config'
    register DuniterRbCli::Commands::Config, 'config', 'config [SUBCOMMAND]', 'Set and get network option'
  end
end
