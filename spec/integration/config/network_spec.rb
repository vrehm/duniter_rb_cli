RSpec.describe "`duniter_rb_cli config network` command", type: :cli do
  it "executes `duniter_rb_cli config help network` command successfully" do
    output = `duniter_rb_cli config help network`
    expected_output = <<-OUT
Usage:
  duniter_rb_cli config network

Options:
  -h, [--help], [--no-help]  # Display usage information

Set and get network option
    OUT

    expect(output).to eq(expected_output)
  end
end
