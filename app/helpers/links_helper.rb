module LinksHelper
	
  def is_active(controller)
    params[:controller] == controller ? "active" : nil
  end

  def tag_setting(tag)
  	case tag
  	when "Gem"
  	  "label-primary"
  	when "News"
  	  "label-danger"
  	when "Teaching"
  	  "label-success"
  	when "Discussion"
  	  "label-warning"	
  	end
  end

end
