require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get Index" do
    get admin_Index_url
    assert_response :success
  end

end
