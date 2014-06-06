require 'test_helper'

class BreedsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

end
