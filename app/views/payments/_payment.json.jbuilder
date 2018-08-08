json.extract! payment, :id, :kvit_num, :date_at, :suma, :content, :order_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)
