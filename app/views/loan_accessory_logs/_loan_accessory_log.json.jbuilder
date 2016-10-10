json.extract! loan_accessory_log, :id, :loan_id, :accessory_id, :reserve_id, :amount, :created_at, :updated_at
json.url loan_accessory_log_url(loan_accessory_log, format: :json)