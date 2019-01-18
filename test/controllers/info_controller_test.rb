require 'test_helper'

class InfoControllerTest < ActionDispatch::IntegrationTest
  test "should get mine" do
    get info_mine_url
    assert_response :success
  end

end
