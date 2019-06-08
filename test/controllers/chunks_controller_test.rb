require 'test_helper'

class ChunksControllerTest < ActionDispatch::IntegrationTest
  test "should get genesis" do
    get chunks_genesis_url
    assert_response :success
  end

end
