RSpec.describe "`duniter_rb_cli config` command", type: :cli do
  it "executes `duniter_rb_cli help config` command successfully" do
    output = `duniter_rb_cli help config`
    expected_output = <<-OUT
Commands:
    OUT

    expect(output).to eq(expected_output)
  end
end
