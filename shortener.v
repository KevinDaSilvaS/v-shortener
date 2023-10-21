module main

import vweb
import server
import log

fn main() {
    log.info('server running')
	vweb.run_at(server.new_shortener(), vweb.RunParams{
        port: 8081
    }) or { panic(err) }
}
