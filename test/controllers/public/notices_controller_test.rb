require "test_helper"

class Public::NoticesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_notices_index_url
    assert_response :success
  end

  test "should get show" do
    get public_notices_show_url
    assert_response :success
  end

  test "should get edit" do
    get public_notices_edit_url
    assert_response :success
  end

  test "should get new" do
    get public_notices_new_url
    assert_response :success
  end
end
