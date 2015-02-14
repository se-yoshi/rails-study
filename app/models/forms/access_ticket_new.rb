module Forms
  class AccessTicketNew
    include NestedModel

    attr_accessor :count
    has_one :access_ticket

    validates :access_ticket, presence: true
    validates :count, presence: true, numericality: { only_integer: true, greater_than: 0 }

    def save!
      ActiveRecord::Base.transaction do
        count.to_i.times do
          access_ticket.dup.save!
        end
      end
    end
  end
end
