class Activity < ActiveRecord::Base
  belongs_to :user
  has_many :orders

  validates_presence_of :title, :max_attendees, :ticket_cost, :date
  validates_numericality_of :max_attendees, :ticket_cost

  delegate :name, to: :user, prefix: :owner

  # @return [Array] available activities ordered by date
  def self.all_available
    includes(:orders).order(:date).
        select { |activity| activity.orders.sum(:quantity) < activity.max_attendees }
  end
end
