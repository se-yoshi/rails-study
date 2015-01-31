module ApplicationHelper
  def alert_messages
    case alert
    when ActiveModel::Errors
      alert.full_messages
    when Enumerable
      alert
    else
      [alert]
    end
  end
end
