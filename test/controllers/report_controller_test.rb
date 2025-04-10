require "test_helper"

class ReportControllerTest < ActionDispatch::IntegrationTest
  test "should get prepare" do
    get report_prepare_url
    assert_response :success
  end

  test "should get fetch" do
    get report_fetch_url
    assert_response :success
  end
end
