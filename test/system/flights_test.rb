require "application_system_test_case"

class FlightsTest < ApplicationSystemTestCase
  setup do
    @flight = flights(:one)
  end

  test "visiting the index" do
    visit flights_url
    assert_selector "h1", text: "Flights"
  end

  test "should create flight" do
    visit flights_url
    click_on "New flight"

    fill_in "Airline", with: @flight.airline_id
    fill_in "Arrive", with: @flight.arrive_id
    fill_in "Depart", with: @flight.depart_id
    fill_in "Duration min", with: @flight.duration_min
    fill_in "Start date time", with: @flight.start_date_time
    click_on "Create Flight"

    assert_text "Flight was successfully created"
    click_on "Back"
  end

  test "should update Flight" do
    visit flight_url(@flight)
    click_on "Edit this flight", match: :first

    fill_in "Airline", with: @flight.airline_id
    fill_in "Arrive", with: @flight.arrive_id
    fill_in "Depart", with: @flight.depart_id
    fill_in "Duration min", with: @flight.duration_min
    fill_in "Start date time", with: @flight.start_date_time
    click_on "Update Flight"

    assert_text "Flight was successfully updated"
    click_on "Back"
  end

  test "should destroy Flight" do
    visit flight_url(@flight)
    click_on "Destroy this flight", match: :first

    assert_text "Flight was successfully destroyed"
  end
end
