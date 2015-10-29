class Session < ActiveRecord::Base
  scope :invalid_sessions, -> {
    where(arel_table[:created_at].lt(Settings.session_duration.from_create.seconds.ago) \
        .or(arel_table[:updated_at].lt(Settings.session_duration.from_last_access.seconds.ago)))
  }

  def self.sweep
    invalid_sessions.delete_all
  end
end
