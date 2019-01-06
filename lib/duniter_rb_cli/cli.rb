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

    desc 'wot_count', 'Count all WOT members for your network setting'
    method_option :help, aliases: '-h', type: :boolean,
                         desc: 'Display usage information'
    def wot_count(*)
      if options[:help]
        invoke :help, ['wot_count']
      else
        require_relative 'commands/wot_count'
        DuniterRbCli::Commands::WotCount.new(options).execute
      end
    end

    require_relative 'commands/config'
    register DuniterRbCli::Commands::Config, 'config', 'config [SUBCOMMAND]', 'Set and get network option'
  end
end
