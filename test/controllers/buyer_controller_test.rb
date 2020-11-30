require 'test_helper'

class BuyerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get buyer_index_url
    assert_response :success
  end

end
