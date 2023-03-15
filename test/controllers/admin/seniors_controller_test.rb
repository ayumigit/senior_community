require "test_helper"

class Admin::SeniorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_seniors_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_seniors_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_seniors_edit_url
    assert_response :success
  end
end
