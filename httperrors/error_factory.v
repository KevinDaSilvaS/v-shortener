module httperrors

import structs as s

fn build_error(message string) s.Response {
	return s.Response(s.ApiError{
    	message: 'Bad Request: link_name shouldnt be empty'
    })
}

pub fn bad_request(message string) s.Response {
	return build_error('Bad Request: $message')
}