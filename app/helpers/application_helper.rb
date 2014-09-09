module ApplicationHelper

  # Returns the full title on a per-page basis.
  def full_title(page_title)
    base_title = "scarto.pl"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # if there are no ads, make current page noindex
  def robots(verdict)
  	if verdict == '1' 
		"NOINDEX, NOFOLLOW"
  	else
  		"INDEX, FOLLOW"
  	end
  end

end
