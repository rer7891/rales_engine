class RevenueSerializer
  include FastJsonapi::ObjectSerializer

def find_sum
  object.sum do |merchant|
require "pry"; binding.pry
    merchant.revenue
  end
end
  attributes :total_revenue do
    find_sum
  end
end
