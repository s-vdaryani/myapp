require 'test_helper'

class SchoolYearsControllerTest < ActionDispatch::IntegrationTest
  # Set up a school year to use in tests
  setup do
    @school_year = school_years(:one)  # Assumes you have a fixture or factory for school years
  end

  # Test the index action
  test "should get index" do
    get school_years_url
    assert_response :success
    assert_not_nil assigns(:school_years)  # Ensure @school_years is set
  end

  # Test the show action
  test "should show school year" do
    get school_year_url(@school_year)
    assert_response :success
  end

  # Test the new action
  test "should get new" do
    get new_school_year_url
    assert_response :success
  end

  # Test the create action
  test "should create school year" do
    assert_difference('SchoolYear.count') do
      post school_years_url, params: { school_year: { name: '2024-2025', start_date: '2024-08-01', end_date: '2025-05-31' } }
    end

    assert_redirected_to school_year_url(SchoolYear.last)  # Redirect to show page of newly created school year
  end

  # Test the edit action
  test "should get edit" do
    get edit_school_year_url(@school_year)
    assert_response :success
  end

  # Test the update action
  test "should update school year" do
    patch school_year_url(@school_year), params: { school_year: { name: 'Updated Year', start_date: '2024-08-01', end_date: '2025-05-31' } }
    assert_redirected_to school_year_url(@school_year)  # Should redirect to show page after update

    # Reload the school year and confirm it was updated
    @school_year.reload
    assert_equal 'Updated Year', @school_year.name
  end

  # Test the destroy action
  test "should destroy school year" do
    assert_difference('SchoolYear.count', -1) do
      delete school_year_url(@school_year)
    end

    assert_redirected_to school_years_url  # Redirect to index page after delete
  end
end
