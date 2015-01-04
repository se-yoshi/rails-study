module DeviseHelper
  def devise_error_messages!
    return "" if resource.errors.empty?

    messages = resource.errors.full_messages.map(&ERB::Util.method(:unwrapped_html_escape)).join("<br />")

    html = <<-HTML
    <div class="alert alert-warning">
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end
