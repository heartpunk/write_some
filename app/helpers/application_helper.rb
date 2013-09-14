module ApplicationHelper
	NavbarItem = Struct.new(:path, :description)
	NAVBAR_PATHS = [
		NavbarItem.new('/home', 'home'),
		NavbarItem.new('/about', 'about'),
		NavbarItem.new('/people/sign_up', 'sign up'),
		NavbarItem.new('/scribbles/new', 'new scribble'),
	]

	def navbar_markup
		"<div class='navbar-inner'><ul class='nav'>" + NAVBAR_PATHS.collect {|navbar_item| navbar_li_element navbar_item}.join + "</ul></div>"
	end

	def navbar_li_element navbar_item
		'<li' + (navbar_item.path == request.path ? ' class="active"' : '') + "><a href='" + navbar_item.path + "''>" + navbar_item.description + "</a></li>"
	end
end
