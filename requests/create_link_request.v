module requests

pub struct CreateLinkRequest {
	pub: link_name string
		 link_url string
}

pub fn (u CreateLinkRequest) is_empty() bool {
	return u.link_name == '' || u.link_url == ''
}