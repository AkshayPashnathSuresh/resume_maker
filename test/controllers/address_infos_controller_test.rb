# frozen_string_literal: true

require 'test_helper'

class AddressInfosControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get address_infos_new_url
    assert_response :success
  end

  test 'should get create' do
    get address_infos_create_url
    assert_response :success
  end
end
