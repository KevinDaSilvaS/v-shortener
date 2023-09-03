module httperrors

import structs as s

pub fn create_response_error(message string, code int) s.ResponseObject<s.Response> {
	body := s.Response(s.ApiError{ message: message })

    return s.ResponseObject<s.Response>{
            code: code
            body: body
            format: s.FileFormats.json
        }
}