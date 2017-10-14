module ApplicationHelper
  def full_title(page_title = '')
    page_title == '' ? "Event.io" : "#{page_title} | Event.io"
  end
end
