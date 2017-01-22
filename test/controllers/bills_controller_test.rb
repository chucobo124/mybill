require 'test_helper'
class BillsControllerTests < ActionDispatch::IntegrationTest
  setup do
    @expect_params = {
      account_data:{
        title: Faker::Commerce.department,
        description: Faker::Lorem.paragraph,
        price: Faker::Commerce.price,
        category_id: 1
      },
      type: 0
    }
  end

  test 'show' do
  end

  test 'should create a income' do
    # type 0 means it create a income
    @expect_params[:type] = 0
    post bills_url, params: @expect_params
    response = JSON.parse(@response.body, symbolize_names: true)
    assert_equal 'ok', response[:success]
    assert Income.find_by_title(@expect_params[:account_data][:title]),
           'Income saving false'
  end

  test 'should create a spends' do
    # type 1 means it create a spends
    @expect_params[:type] = 1
    post bills_url, params: @expect_params
    response = JSON.parse(@response.body, symbolize_names: true)
    assert_equal 'ok', response[:success]
    assert Spend.find_by_title(@expect_params[:account_data][:title]),
           'Spend saving false'
  end

  test 'should return error when type doesn\'t exist' do
    @expect_params[:type] = 99
    post bills_url, params: @expect_params
    response = JSON.parse(@response.body, symbolize_names: true)
    assert_equal 'The type is not include or you have wrong params',
                response[:error]
  end
end
