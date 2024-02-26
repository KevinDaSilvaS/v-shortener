module controllers

import structs as s
import requests as r
import httperrors as he
import services
import log

pub fn create_link(req_body r.CreateLinkRequest) s.ResponseObject<s.Response> {
    log.info('[CONTROLLER] - create_link function')
    if req_body.is_empty() {
        log.warn('request without body field')
        return he.create_response_error(
            'fields link_name(string) or link_url(string) should not be empty',
            400)
    }

    return services.create_link(req_body)
}

pub fn get_link(link_name string) s.ResponseObject<s.Response> {
    log.info('[CONTROLLER] - get_link function')
    return services.get_link_url(link_name)
}