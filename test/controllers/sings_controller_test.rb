require 'test_helper'

class SingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sings_index_url
    assert_response :success
  end

  test "should get new" do
    get sings_new_url
    assert_response :success
  end

  test "should get show" do
    get sings_show_url
    assert_response :success
  end

  test "should get create" do
    get sings_create_url
    assert_response :success
  end

  test "should get update" do
    get sings_update_url
    assert_response :success
  end

  test "should get edit" do
    get sings_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get sings_destroy_url
    assert_response :success
  end

end
