class Promocode < ActiveRecord::Base

has_many :orders
has_many :users


  def sales_string
  end

  def rate_string
  end

  def earnings_string
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
