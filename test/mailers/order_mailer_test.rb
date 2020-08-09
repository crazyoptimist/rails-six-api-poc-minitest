require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  
  setup do
    @order = orders(:one)
  end

  test "Shoud be set to be delivered to the user from the order passed in" do
    mail = OrderMailer.send_confirmation(@order)
    assert_equal "Order Confirmation", mail.subject
    assert_equal [@order.user.email], mail.to
    assert_equal ["no-reply@crazyoptimist.net"], mail.from
    assert_match "You ordered #{@order.products.count} products", mail.body.encoded
  end
end
