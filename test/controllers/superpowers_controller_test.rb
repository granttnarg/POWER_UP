require 'test_helper'

class SuperpowersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get superpowers_new_url
    assert_response :success
  end

  test "should get create" do
    get superpowers_create_url
    assert_response :success
  end

  test "should get destroy" do
    get superpowers_destroy_url
    assert_response :success
  end

  test "should get show" do
    get superpowers_show_url
    assert_response :success
  end

  test "should get index" do
    get superpowers_index_url
    assert_response :success
  end

end
