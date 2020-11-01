require 'test_helper'

class Admin::BadgeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_badge_index_url
    assert_response :success
  end

  test "should get new" do
    get admin_badge_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_badge_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_badge_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_badge_update_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_badge_destroy_url
    assert_response :success
  end

end
