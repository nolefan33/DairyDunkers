require 'test_helper'

class CookieControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cookie_show_url
    assert_response :success
  end

  test "should get new" do
    get cookie_new_url
    assert_response :success
  end

end
