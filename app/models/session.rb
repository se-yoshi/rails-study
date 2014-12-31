class Session < ActiveRecord::Base
  def self.sweep
    delete_all(arel_table[:created_at].lt(1.weeks.ago).or(arel_table[:updated_at].lt(30.minutes.ago)))
  end
end
