RSpec.describe "`duniter_rb_cli config` command", type: :cli do
  it "executes `duniter_rb_cli help config` command successfully" do
    output = `duniter_rb_cli help config`
    expected_output = <<-OUT
Commands:
  duniter_rb_cli config help [COMMAND]  # Describe subcommands or one specific subcommand
  duniter_rb_cli config network         # Set and get network option

    OUT

    expect(output).to eq(expected_output)
  end
end
