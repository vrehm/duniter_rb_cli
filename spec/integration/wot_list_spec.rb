RSpec.describe "`duniter_rb_cli wot_list` command", type: :cli do
  it "executes `duniter_rb_cli help wot_list` command successfully" do
    output = `duniter_rb_cli help wot_list`
    expected_output = <<-OUT
Usage:
  duniter_rb_cli wot_list

Options:
  -h, [--help], [--no-help]  # Display usage information

List all UIDs of WOT members for your network setting
    OUT

    expect(output).to eq(expected_output)
  end
end
