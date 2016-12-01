require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get index" do
    @request.host = 'lojas.primeira.local.cameloverde.com'
    get :index
    assert_response :success
  end

end
