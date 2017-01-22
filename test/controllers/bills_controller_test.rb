require 'test_helper'
class BillsControllerTests < ActionDispatch::IntegrationTest
  setup do
    @expect_params = {
      account_data: {
        title: Faker::Commerce.department,
        description: Faker::Lorem.paragraph,
        price: Faker::Commerce.price,
        category_id: 1
      },
      type: 0
    }
  end

  test 'should returns bills with pagination in index method' do
    @page_number = 1
    get bills_url + '?page=' + @page_number.to_s
    responses = JSON.parse(@response.body, symbolize_names: true)
    assert_not_empty responses, 'Can not find any bill'
  end

  test 'should creates an income' do
    # type 0 means it create a income
    @expect_params[:type] = 0
    post bills_url, params: @expect_params
    response = JSON.parse(@response.body, symbolize_names: true)
    assert_equal 'ok', response[:success]
    assert Income.find_by_title(@expect_params[:account_data][:title]),
           'Income saving false'
  end

  test 'should creates a spend' do
    # type 1 means it create a spends
    @expect_params[:type] = 1
    post bills_url, params: @expect_params
    response = JSON.parse(@response.body, symbolize_names: true)
    assert_equal 'ok', response[:success]
    assert Spend.find_by_title(@expect_params[:account_data][:title]),
           'Spend saving false'
  end

  test 'should returns error when type doesn\'t exist' do
    @expect_params[:type] = 99
    post bills_url, params: @expect_params
    response = JSON.parse(@response.body, symbolize_names: true)
    assert_equal 'The type is not include or you have wrong params',
                 response[:error]
  end
end
