# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :ticket do
    name "MyString"
    description "MyString"
    status 1
    started_on "2012-06-08 21:45:49"
    customer_id 1
    customer_contract_id 1
    status "MyString"
    completed_on "2012-06-08 21:45:49"
    settlement_date "2012-06-08"
    settlement_status "MyString"
    type ""
    bom_id 1
  end
end
