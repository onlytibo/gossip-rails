require 'test_helper'

class GossipControllerTest < ActionDispatch::IntegrationTest
  test "should get listing" do
    get gossip_listing_url
    assert_response :success
  end

end
