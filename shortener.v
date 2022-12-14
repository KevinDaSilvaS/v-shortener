module main

import vweb
import server

fn main() {
	vweb.run_at(server.new_shortener(), vweb.RunParams{
        port: 8081
    }) or { panic(err) }
}
