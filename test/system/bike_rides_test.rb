require "application_system_test_case"

class BikeRidesTest < ApplicationSystemTestCase
  setup do
    @bike_ride = bike_rides(:one)
  end

  test "visiting the index" do
    visit bike_rides_url
    assert_selector "h1", text: "Bike rides"
  end

  test "should create bike ride" do
    visit bike_rides_url
    click_on "New bike ride"

    fill_in "Average cadence", with: @bike_ride.average_cadence
    fill_in "Average heartrate", with: @bike_ride.average_heartrate
    fill_in "Average speed", with: @bike_ride.average_speed
    fill_in "Average watts", with: @bike_ride.average_watts
    fill_in "Distance", with: @bike_ride.distance
    fill_in "Elapsed time", with: @bike_ride.elapsed_time
    fill_in "Kilojoules", with: @bike_ride.kilojoules
    fill_in "Moving time", with: @bike_ride.moving_time
    fill_in "Prediction", with: @bike_ride.prediction
    fill_in "Total elevation gain", with: @bike_ride.total_elevation_gain
    fill_in "User", with: @bike_ride.user_id
    fill_in "Weighted average watts", with: @bike_ride.weighted_average_watts
    click_on "Create Bike ride"

    assert_text "Bike ride was successfully created"
    click_on "Back"
  end

  test "should update Bike ride" do
    visit bike_ride_url(@bike_ride)
    click_on "Edit this bike ride", match: :first

    fill_in "Average cadence", with: @bike_ride.average_cadence
    fill_in "Average heartrate", with: @bike_ride.average_heartrate
    fill_in "Average speed", with: @bike_ride.average_speed
    fill_in "Average watts", with: @bike_ride.average_watts
    fill_in "Distance", with: @bike_ride.distance
    fill_in "Elapsed time", with: @bike_ride.elapsed_time
    fill_in "Kilojoules", with: @bike_ride.kilojoules
    fill_in "Moving time", with: @bike_ride.moving_time
    fill_in "Prediction", with: @bike_ride.prediction
    fill_in "Total elevation gain", with: @bike_ride.total_elevation_gain
    fill_in "User", with: @bike_ride.user_id
    fill_in "Weighted average watts", with: @bike_ride.weighted_average_watts
    click_on "Update Bike ride"

    assert_text "Bike ride was successfully updated"
    click_on "Back"
  end

  test "should destroy Bike ride" do
    visit bike_ride_url(@bike_ride)
    click_on "Destroy this bike ride", match: :first

    assert_text "Bike ride was successfully destroyed"
  end
end
