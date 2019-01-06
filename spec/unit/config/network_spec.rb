require 'duniter_rb_cli/commands/config/network'

RSpec.describe DuniterRbCli::Commands::Config::Network do
  it "executes `config network` command successfully" do
    output = StringIO.new
    options = {}
    command = DuniterRbCli::Commands::Config::Network.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
