require "test_helper"

class BikeRidesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bike_ride = bike_rides(:one)
  end

  test "should get index" do
    get bike_rides_url
    assert_response :success
  end

  test "should get new" do
    get new_bike_ride_url
    assert_response :success
  end

  test "should create bike_ride" do
    assert_difference("BikeRide.count") do
      post bike_rides_url, params: { bike_ride: { average_cadence: @bike_ride.average_cadence, average_heartrate: @bike_ride.average_heartrate, average_speed: @bike_ride.average_speed, average_watts: @bike_ride.average_watts, distance: @bike_ride.distance, elapsed_time: @bike_ride.elapsed_time, kilojoules: @bike_ride.kilojoules, moving_time: @bike_ride.moving_time, prediction: @bike_ride.prediction, total_elevation_gain: @bike_ride.total_elevation_gain, user_id: @bike_ride.user_id, weighted_average_watts: @bike_ride.weighted_average_watts } }
    end

    assert_redirected_to bike_ride_url(BikeRide.last)
  end

  test "should show bike_ride" do
    get bike_ride_url(@bike_ride)
    assert_response :success
  end

  test "should get edit" do
    get edit_bike_ride_url(@bike_ride)
    assert_response :success
  end

  test "should update bike_ride" do
    patch bike_ride_url(@bike_ride), params: { bike_ride: { average_cadence: @bike_ride.average_cadence, average_heartrate: @bike_ride.average_heartrate, average_speed: @bike_ride.average_speed, average_watts: @bike_ride.average_watts, distance: @bike_ride.distance, elapsed_time: @bike_ride.elapsed_time, kilojoules: @bike_ride.kilojoules, moving_time: @bike_ride.moving_time, prediction: @bike_ride.prediction, total_elevation_gain: @bike_ride.total_elevation_gain, user_id: @bike_ride.user_id, weighted_average_watts: @bike_ride.weighted_average_watts } }
    assert_redirected_to bike_ride_url(@bike_ride)
  end

  test "should destroy bike_ride" do
    assert_difference("BikeRide.count", -1) do
      delete bike_ride_url(@bike_ride)
    end

    assert_redirected_to bike_rides_url
  end
end
