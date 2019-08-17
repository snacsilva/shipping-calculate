require 'test_helper'

class DistancesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @distance = distances(:one)
  end

  test "should get index" do
    get distances_url, as: :json
    assert_response :success
  end

  test "should create distance" do
    assert_difference('Distance.count') do
      post distances_url, params: { distance: { destination: @distance.destination, distance: @distance.distance, origin: @distance.origin } }, as: :json
    end

    assert_response 201
  end

  test "should show distance" do
    get distance_url(@distance), as: :json
    assert_response :success
  end

  test "should update distance" do
    patch distance_url(@distance), params: { distance: { destination: @distance.destination, distance: @distance.distance, origin: @distance.origin } }, as: :json
    assert_response 200
  end

  test "should destroy distance" do
    assert_difference('Distance.count', -1) do
      delete distance_url(@distance), as: :json
    end

    assert_response 204
  end
end
