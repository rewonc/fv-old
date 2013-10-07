class ProductTag < ActiveRecord::Base
  belongs_to :product
  serialize :options
end
