module ApplicationHelper
	def full_title(page_title = "")
			initial_title = "Ruby on Rails Tutorial Sample App"
		if page_title.empty?
			initial_title
		else
			page_title + " | " + initial_title
		end
	end
end
