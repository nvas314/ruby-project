require "test_helper"

class TeamPostsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get team_posts_index_url
    assert_response :success
  end

  test "should get show" do
    get team_posts_show_url
    assert_response :success
  end

  test "should get new" do
    get team_posts_new_url
    assert_response :success
  end
end
