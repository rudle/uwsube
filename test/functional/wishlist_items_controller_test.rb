require 'test_helper'

class WishlistItemsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wishlist_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wishlist_items" do
    assert_difference('WishlistItems.count') do
      post :create, :wishlist_items => { }
    end

    assert_redirected_to wishlist_items_path(assigns(:wishlist_items))
  end

  test "should show wishlist_items" do
    get :show, :id => wishlist_items(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => wishlist_items(:one).id
    assert_response :success
  end

  test "should update wishlist_items" do
    put :update, :id => wishlist_items(:one).id, :wishlist_items => { }
    assert_redirected_to wishlist_items_path(assigns(:wishlist_items))
  end

  test "should destroy wishlist_items" do
    assert_difference('WishlistItems.count', -1) do
      delete :destroy, :id => wishlist_items(:one).id
    end

    assert_redirected_to wishlist_items_path
  end
end
