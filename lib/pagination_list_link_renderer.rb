class PaginationListLinkRenderer < WillPaginate::ActionView::LinkRenderer
  # thanks to http://thewebfellas.com/blog/2010/8/22/revisited-roll-your-own-pagination-links-with-will_paginate-and-rails-3
  def to_html
    links = @options[:page_links] ? windowed_links : []

    links.unshift(page_link_or_span(@collection.previous_page, 'previous', @options[:previous_label]))
    links.push(page_link_or_span(@collection.next_page, 'next', @options[:next_label]))

    html = links.join(@options[:separator])
    @template.content_tag(:ul, html.html_safe, :class => "pagination")
  end

  protected

  def windowed_links
    windowed_page_numbers.map { |n| page_link_or_span(n, (n == current_page ? 'current' : nil)) }
  end

  def page_link_or_span(page, span_class, text = nil)
    text ||= page.to_s
    if page && page != current_page
      unless text == "gap"
        page_link(page, text, :class => span_class)
      else
        @template.content_tag(:li, "&hellip;".html_safe)
      end
    else
      page_span(page, text, :class => span_class)
    end
  end

  def page_link(page, text, attributes = {})
    tag(:li, link(text, page))
  end

  def page_span(page, text, attributes = {})
    tag(:li, link(text, page, attributes))
  end

  def page_number(page)
    unless page == current_page
      tag(:li, link(page, page, :rel => rel_value(page)))
    else
      tag(:li, page, :class => "current")
    end
  end

  def previous_or_next_page(page, text, classname)
    if page
      tag(:li, link(text, page), :class => classname)
    else
      tag(:li, text, :class => classname + ' disabled')
    end
  end

  def html_container(html)
    tag(:ul, html, container_attributes)
  end
end