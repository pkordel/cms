require "test_helper"

describe TaxonomiesController do
  include Devise::TestHelpers
  
  before do
    @taxonomy = Taxonomy.create(name: 'Eggs')
    @editor = User.create(email: 'editor@exmaple.com', password: '12345678')
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in @editor
  end

  it "must get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxonomies)
  end

  it "must get new" do
    get :new
    assert_response :success
  end

  it "must create taxonomy" do
    assert_difference('Taxonomy.count') do
      post :create, taxonomy: {  }
    end

    assert_redirected_to taxonomy_path(assigns(:taxonomy))
  end

  it "must show taxonomy" do
    get :show, id: @taxonomy
    assert_response :success
  end

  it "must get edit" do
    get :edit, id: @taxonomy
    assert_response :success
  end

  it "must update taxonomy" do
    put :update, id: @taxonomy, taxonomy: {  }
    assert_redirected_to taxonomy_path(assigns(:taxonomy))
  end

  it "must destroy taxonomy" do
    assert_difference('Taxonomy.count', -1) do
      delete :destroy, id: @taxonomy
    end

    assert_redirected_to taxonomies_path
  end

end
