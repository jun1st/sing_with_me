require 'test_helper'

class SongControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get song_index_url
    assert_response :success
  end

  test "should get new" do
    get song_new_url
    assert_response :success
  end

  test "should get create" do
    get song_create_url
    assert_response :success
  end

  test "should get edit" do
    get song_edit_url
    assert_response :success
  end

  test "should get update" do
    get song_update_url
    assert_response :success
  end

  test "should get delete" do
    get song_delete_url
    assert_response :success
  end

end
