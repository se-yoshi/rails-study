module Forms
  class AccessTicketNew
    include ActiveModel::Model

    attr_accessor :access_ticket, :count

    validates :access_ticket, presence: true
    validate :validate_access_ticket
    validates :count, presence: true, numericality: { only_integer: true, greater_than: 0 }

    def self.human_attribute_name(attribute, options = {})
      parts = attribute.to_s.split(".")
      if parts.shift == "access_ticket" && parts.present?
        AccessTicket.human_attribute_name(parts.join(".").to_sym, options)
      else
        super
      end
    end

    def access_ticket_attributes=(attributes)
      build_access_ticket(attributes)
    end

    def build_access_ticket(*args)
      @access_ticket = AccessTicket.new(*args)
    end

    def validate_access_ticket
      return if @access_ticket.try(:valid?)
      @access_ticket.try(:errors).try(:each) do |attribute, error|
        errors.add(:"access_ticket.#{attribute}", error)
      end
    end

    def save!
      ActiveRecord::Base.transaction do
        count.to_i.times do
          access_ticket.dup.save!
        end
      end
    end
  end
end
