require 'test_helper'

class MetricsControllerTest < ActionController::TestCase
  test "should get host" do
    get :host
    assert_response :success
  end

end
