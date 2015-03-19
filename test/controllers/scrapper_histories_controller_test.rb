require 'test_helper'

class ScrapperHistoriesControllerTest < ActionController::TestCase
  setup do
    @scrapper_history = scrapper_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scrapper_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create scrapper_history" do
    assert_difference('ScrapperHistory.count') do
      post :create, scrapper_history: { name: @scrapper_history.name, url: @scrapper_history.url }
    end

    assert_redirected_to scrapper_history_path(assigns(:scrapper_history))
  end

  test "should show scrapper_history" do
    get :show, id: @scrapper_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @scrapper_history
    assert_response :success
  end

  test "should update scrapper_history" do
    patch :update, id: @scrapper_history, scrapper_history: { name: @scrapper_history.name, url: @scrapper_history.url }
    assert_redirected_to scrapper_history_path(assigns(:scrapper_history))
  end

  test "should destroy scrapper_history" do
    assert_difference('ScrapperHistory.count', -1) do
      delete :destroy, id: @scrapper_history
    end

    assert_redirected_to scrapper_histories_path
  end
end
