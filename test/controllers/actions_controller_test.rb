require 'test_helper'

class ActionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get actions_create_url
    assert_response :success
  end

end
