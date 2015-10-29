module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    content_tag(:div, class: "alert alert-warning") do
      content_tag(:ul) do
        resource.errors.full_messages.each do |message|
          concat content_tag(:li, message)
        end
      end
    end
  end
end
