require 'test_helper'

class Admins::AccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_accounts_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_accounts_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_accounts_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get admins_accounts_destroy_url
    assert_response :success
  end

end
