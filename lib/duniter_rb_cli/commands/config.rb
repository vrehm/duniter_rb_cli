# frozen_string_literal: true

require 'thor'

module DuniterRbCli
  module Commands
    class Config < Thor

      namespace :config

      desc 'network', 'Set and get network option'
      method_option :help, aliases: '-h', type: :boolean,
                           desc: 'Display usage information'
      def network(*)
        if options[:help]
          invoke :help, ['network']
        else
          require_relative 'config/network'
          DuniterRbCli::Commands::Config::Network.new(options).execute
        end
      end
    end
  end
end
