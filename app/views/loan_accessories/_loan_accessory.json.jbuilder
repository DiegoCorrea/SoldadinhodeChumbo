json.extract! loan_accessory, :id, :loan_id, :accessory_id, :reserve_id, :amount, :created_at, :updated_at
json.url loan_accessory_url(loan_accessory, format: :json)