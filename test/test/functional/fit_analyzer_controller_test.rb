require 'test_helper'

class FitAnalyzerControllerTest < ActionController::TestCase
  test "should get analyzer" do
    get :analyzer
    assert_response :success
  end

end
