module controllers

import structs as s
import requests as r
import httperrors as he
import services

pub fn create_link(req_body r.CreateLinkRequest) s.ResponseObject<s.Response> {
    if req_body.is_empty() {
        return he.create_response_error(
            'fields link_name(string) or link_url(string) should not be empty')
    }

    return services.create_link(req_body)
}

pub fn get_link(link_name string) s.ResponseObject<s.Response> {
    return services.get_link_url(link_name)
}