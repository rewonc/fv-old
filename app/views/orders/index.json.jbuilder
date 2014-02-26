json.array!(@orders) do |order|
  json.extract! order, :id, :name, :size, :frequency, :plan, :price, :promocode, :firstname, :lastname, :address, :apt, :city, :state, :zip, :stripetoken, :user_id
  json.url order_url(order, format: :json)
end
