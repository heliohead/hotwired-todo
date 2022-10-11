ActionView::Base.field_error_proc = proc do |html_tag, instance|
  "<div>#{html_tag}</div>".html_safe
end
