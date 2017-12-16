class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :activity

  validates_presence_of :user_id, :activity_id
  validates_numericality_of :quantity
  validate :max_attendees_per_activity

  # check if quantity matches the limit of orders for chosen activity
  def max_attendees_per_activity
    my_activity = Activity.includes(:orders).find(activity_id)

    if quantity.to_i + my_activity.orders.sum(:quantity) > my_activity.max_attendees
      errors.add :activity, 'does not have enough tickets available'
    end
  end
end
