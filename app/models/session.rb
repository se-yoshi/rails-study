class Session < ActiveRecord::Base
  scope :invalid_sessions, -> do
    where(arel_table[:created_at].lt(1.weeks.ago).or(arel_table[:updated_at].lt(30.minutes.ago)))
  end

  def self.sweep
    invalid_sessions.delete_all
  end
end
