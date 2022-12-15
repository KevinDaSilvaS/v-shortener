module server

import vweb
import controllers
import structs as s
import requests as r
import json

struct App {
    vweb.Context
}

pub fn new_shortener() &App {
    mut app := &App{}
    return app
}

['/:link']
pub fn (mut app App) get_link_url_and_redirect(link string) vweb.Result {
	return response(mut app, controllers.get_link(link))
}

['/create'; post]
pub fn (mut app App) create_link() !vweb.Result {
	request_body := json.decode(r.CreateLinkRequest, app.req.data)!
	println(request_body)
	return response(mut app, controllers.create_link(request_body))
}

pub fn response(mut app App, obj s.ResponseObject<s.Response>) vweb.Result {
	app.set_status(obj.code, 'string que escrevi')
	return match obj.format {
		.html { app.html('$obj.body') } 
		.json { app.json(obj.body) }
		.text { app.text('$obj.body') }
	}
}
