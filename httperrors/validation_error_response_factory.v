module httperrors

import structs as s
import httperrors as he

pub fn create_response_error(message string) s.ResponseObject<s.Response> {
	return s.ResponseObject<s.Response>{
            code: 400
            body: he.bad_request(message)
            format: s.FileFormats.json
        }
}

