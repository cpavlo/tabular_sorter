require 'test_helper'

class TestResourcesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @test_resource = test_resources(:one)
  end

  test 'should get index' do
    get test_resources_url
    assert_response :success
  end

  test 'should get new' do
    get new_test_resource_url
    assert_response :success
  end

  test 'should create test_resource' do
    assert_difference('TestResource.count') do
      post test_resources_url, params: { test_resource: { age: @test_resource.age, name: @test_resource.name, kind: @test_resource.kind } }
    end

    assert_redirected_to test_resource_url(TestResource.last)
  end

  test 'should show test_resource' do
    get test_resource_url(@test_resource)
    assert_response :success
  end

  test 'should get edit' do
    get edit_test_resource_url(@test_resource)
    assert_response :success
  end

  test 'should update test_resource' do
    patch test_resource_url(@test_resource), params: { test_resource: { age: @test_resource.age, name: @test_resource.name, kind: @test_resource.kind } }
    assert_redirected_to test_resource_url(@test_resource)
  end

  test 'should destroy test_resource' do
    assert_difference('TestResource.count', -1) do
      delete test_resource_url(@test_resource)
    end

    assert_redirected_to test_resources_url
  end
end
