require "test_helper"

class WaitlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @waitlist = waitlists(:one)
  end

  test "should get index" do
    get waitlists_url
    assert_response :success
  end

  test "should get new" do
    get new_waitlist_url
    assert_response :success
  end

  test "should create waitlist" do
    assert_difference('Waitlist.count') do
      post waitlists_url, params: { waitlist: { applicant_id: @waitlist.applicant_id, approved_rejected_processing: @waitlist.approved_rejected_processing, datetime: @waitlist.datetime, property: @waitlist.property } }
    end

    assert_redirected_to waitlist_url(Waitlist.last)
  end

  test "should show waitlist" do
    get waitlist_url(@waitlist)
    assert_response :success
  end

  test "should get edit" do
    get edit_waitlist_url(@waitlist)
    assert_response :success
  end

  test "should update waitlist" do
    patch waitlist_url(@waitlist), params: { waitlist: { applicant_id: @waitlist.applicant_id, approved_rejected_processing: @waitlist.approved_rejected_processing, datetime: @waitlist.datetime, property: @waitlist.property } }
    assert_redirected_to waitlist_url(@waitlist)
  end

  test "should destroy waitlist" do
    assert_difference('Waitlist.count', -1) do
      delete waitlist_url(@waitlist)
    end

    assert_redirected_to waitlists_url
  end
end
