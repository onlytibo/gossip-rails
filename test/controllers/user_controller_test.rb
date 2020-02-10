require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get user_welcome_url
    assert_response :success
  end

end
