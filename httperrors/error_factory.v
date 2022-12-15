module httperrors

import structs as s

fn build_error(message string) s.Response {
	return s.Response(s.ApiError{
    	message: message
    })
}

pub fn bad_request(message string) s.Response {
	return build_error('Bad Request: $message')
}