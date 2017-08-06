require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get landing" do
    get admin_landing_url
    assert_response :success
  end

end
