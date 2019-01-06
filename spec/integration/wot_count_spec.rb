RSpec.describe "`duniter_rb_cli wot_count` command", type: :cli do
  it "executes `duniter_rb_cli help wot_count` command successfully" do
    output = `duniter_rb_cli help wot_count`
    expected_output = <<-OUT
Usage:
  duniter_rb_cli wot_count

Options:
  -h, [--help], [--no-help]  # Display usage information

Count all WOT members for your network setting
    OUT

    expect(output).to eq(expected_output)
  end
end
