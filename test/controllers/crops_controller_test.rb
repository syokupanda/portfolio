require 'test_helper'

class CropsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get crops_index_url
    assert_response :success
  end

  test "should get new" do
    get crops_new_url
    assert_response :success
  end

  test "should get create" do
    get crops_create_url
    assert_response :success
  end

  test "should get edit" do
    get crops_edit_url
    assert_response :success
  end

  test "should get update" do
    get crops_update_url
    assert_response :success
  end

  test "should get destroy" do
    get crops_destroy_url
    assert_response :success
  end

end
