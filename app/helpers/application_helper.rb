module ApplicationHelper
    def current_item_link(url)
        current_link = request.original_fullpath
        if current_link.eql? url
          css = "current-menu-item"
        end
        css
    end
    def avatar(url)
      if url.length > 0
        image_tag url
      else
        image_tag('default_avatar') 
      end
    end
    def image_for_review(url)
      if url.length > 0
        image_tag url
      else
        image_tag('no-thumb')
      end
    end
end
