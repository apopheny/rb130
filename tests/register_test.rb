require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!

require_relative '../cash_register'
require_relative '../transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(500)
    @transaction = Transaction.new(250)
  end

  # We now have the foundation of our CashRegister test class set up. Let's start testing! We'll start with the CashRegister#accept_money method. Write a test for the #accept_money method.
  def test_accept_money
    prior_amount = @register.total_money
    @transaction.amount_paid = 100
    @register.accept_money(@transaction)
    assert_equal(prior_amount + 100, @register.total_money)
  end

  # Write a test for the method, CashRegister#change.
  def test_change
    @transaction.amount_paid = 500
    assert_equal(250, @register.change(@transaction))
  end

  # Write a test for method CashRegister#give_receipt that ensures it displays a valid receipt.
  def test_receipt
    assert_output(/You've paid \$250./) { @register.give_receipt(@transaction) }
  end
end