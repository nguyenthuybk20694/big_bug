module ApplicationHelper
    def current_item_link(url)
        current_link = request.original_fullpath
        if current_link.eql? url
          css = "current-menu-item"
        end
        css
    end
end
