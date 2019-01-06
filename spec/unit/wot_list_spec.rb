require 'duniter_rb_cli/commands/wot_list'

RSpec.describe DuniterRbCli::Commands::WotList do
  it "executes `wot_list` command successfully" do
    output = StringIO.new
    options = {}
    command = DuniterRbCli::Commands::WotList.new(options)

    command.execute(output: output)

    expect(output.string).to eq("OK\n")
  end
end
