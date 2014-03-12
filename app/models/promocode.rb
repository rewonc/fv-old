class Promocode < ActiveRecord::Base

has_many :orders
has_many :users


  def sales_string
    case id
    when 1
      x = 0
      orders_with_charges.each do |order|
        x = x + order.price 
      end
      return Order.price_string(x)
    when 2

    else
      return ''
    end
  end

  def rate_string
    case id
    when 1
       return "$5 per order - cost of book"
    when 2

    else
      return ''
    end
  end

  def earnings_string
    case id
    when 1
       x = orders_with_charges.length * 500
       return Order.price_string(x)
    when 2

    else
      return ''
    end
  end

  def orders_with_charges
    orders.select {|x| !x.charge.nil?}
  end

end


=begin


a = Promocode.new
a.code = "a67mm1"
a.email = "rewonc@gmail.com"
a.id = 1
a.save

a = Promocode.new
a.code = "7zg66n"
a.email = "rewoncc@gmail.com"
a.id = 2
a.save

=end
