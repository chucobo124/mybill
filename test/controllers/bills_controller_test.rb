require 'test_helper'
class BillsControllerTests < ActionDispatch::IntegrationTest
  setup do
    @data_form = {
      title: Faker::Commerce.department,
      description: Faker::Lorem.paragraph,
      price: Faker::Commerce.price,
      category_id: 1
    }
  end
  test 'create' do
    post bill_url, params: {name: 'Lucas'}
    response = JSON.parse(@response.body)
    assert_equal 'ok', response[:success]
    follow_redirect!
  end
end
