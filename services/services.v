module services

import structs as s
import requests as r
import httperrors as he

pub fn create_link(req_body r.CreateLinkRequest) s.ResponseObject<s.Response> {
    if req_body.link_name == '' {
        return s.ResponseObject<s.Response>{
            code: 400
            body: he.bad_request('Bad Request: link_name shouldnt be empty')
            format: s.FileFormats.json
        }
    }

    created_link := s.Response(s.CreatedLink{
        link_name: 'this is the first'
        creation_date: 'string'
		expiration_date: 'string'
    })

    return s.ResponseObject<s.Response>{
            code: 201
            body: created_link
            format: s.FileFormats.json
        }
}

pub fn get_link_url(link_name string) s.ResponseObject<s.Response> {
    page_link := 'https://www.google.com/'
    script := '<script>window.location.href = "${page_link}"</script>'
    response := s.Response(script)

    return s.ResponseObject<s.Response>{
            code: 200
            body: response
            format: s.FileFormats.html
        }
}