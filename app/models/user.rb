class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :orders

  # @return [Relation<Order>] for user, sorted by date
  def my_orders
    orders.joins(:activity).order 'activities.date'
  end
end
