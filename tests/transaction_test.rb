require "minitest/autorun"
require "minitest/reporters"
require "stringio"

MiniTest::Reporters.use!

require_relative "../transaction"
require_relative "../cash_register"

class TestTransaction < MiniTest::Test
  def setup
    @register = CashRegister.new(500)
    @transaction = Transaction.new(250)
  end

  # Write a test that verifies that Transaction#prompt_for_payment sets the amount_paid correctly. We've changed the transaction class a bit to make testing this a bit easier. The Transaction#prompt_for_payment now reads as:
  def test_prompt_for_payment
    input = StringIO.new("200\n300\n")
    output = StringIO.new
    expected = <<~OUTPUT
    You owe $250.
    How much are you paying?
    That is not the correct amount. Please make sure to pay the full cost.
    You owe $250.
    How much are you paying?
    OUTPUT

    assert_output(nil) { @transaction.prompt_for_payment(input: input, output: output) }
    assert_equal(300, @transaction.amount_paid)
    assert_equal(expected, output.string)
  end
end