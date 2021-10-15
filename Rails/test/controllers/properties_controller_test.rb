require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property = properties(:one)
  end

  test "should get index" do
    get properties_url
    assert_response :success
  end

  test "should get new" do
    get new_property_url
    assert_response :success
  end

  test "should create property" do
    assert_difference('Property.count') do
      post properties_url, params: { property: { address: @property.address, application_fee: @property.application_fee, earliest_start_date: @property.earliest_start_date, laundry: @property.laundry, monthly_rent: @property.monthly_rent, name: @property.name, occupied_by: @property.occupied_by, parking: @property.parking, pets_allowed: @property.pets_allowed, size: @property.size, terms_available: @property.terms_available } }
    end

    assert_redirected_to property_url(Property.last)
  end

  test "should show property" do
    get property_url(@property)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_url(@property)
    assert_response :success
  end

  test "should update property" do
    patch property_url(@property), params: { property: { address: @property.address, application_fee: @property.application_fee, earliest_start_date: @property.earliest_start_date, laundry: @property.laundry, monthly_rent: @property.monthly_rent, name: @property.name, occupied_by: @property.occupied_by, parking: @property.parking, pets_allowed: @property.pets_allowed, size: @property.size, terms_available: @property.terms_available } }
    assert_redirected_to property_url(@property)
  end

  test "should destroy property" do
    assert_difference('Property.count', -1) do
      delete property_url(@property)
    end

    assert_redirected_to properties_url
  end
end
