class AccessTicketPublishJob < ActiveJob::Base
  queue_as :default

  def perform(attributes)
    form = Forms::AccessTicketNew.new(attributes)
    form.save!
  end
end
