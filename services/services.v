module services

import structs as s
import requests as r
import repository as repo
import httperrors as he
import time

pub fn create_link(req_body r.CreateLinkRequest) s.ResponseObject<s.Response> {
    db := repo.setup()
    if !db.save(req_body.link_name, req_body.link_url) {
        return he.create_response_error('unable to reach database', 500)
    }
    
    created_link := s.Response(s.CreatedLink{
        link_name: req_body.link_name
        creation_date: time.now().hhmmss()
    })

    return s.ResponseObject<s.Response>{
            code: 201
            body: created_link
            format: s.FileFormats.json
        }
}

pub fn get_link_url(link_name string) s.ResponseObject<s.Response> {
    db := repo.setup()
    result := db.get(link_name)
    if !result.success {
        return he.create_response_error('url not found', 404)
    }

    page_link := result.data
    script := '<script>window.location.href = "${page_link}"</script>'
    response := s.Response(script)

    return s.ResponseObject<s.Response>{
            code: 200
            body: response
            format: s.FileFormats.html
        }
}