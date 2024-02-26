module main

import vweb
import server
import log

fn main() {
    log.info('Starting server')
	vweb.run_at(server.new_shortener(), vweb.RunParams{
        port: 8081
        startup_message: 'Server running'
    }) or { panic(err) }
}
