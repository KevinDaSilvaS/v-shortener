module requests
import structs as s

pub struct CreateLinkRequest {
	pub: link_name string
}

pub fn (u CreateLinkRequest) is_empty() bool {
	return u.link_name == ''
}