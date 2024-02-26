module repository

import coachonko.redis
import time

pub struct Cache {
	client &redis.Client
}

pub struct StoredValue<T> {
	pub: 
		success bool
		data T
}

pub fn (c Cache) save(key string, value string) bool {
	interval := time.Duration(30 * time.second)
	if _ := c.client.set(key, value, interval) {
		return true
	}

	return false
}

pub fn (c Cache) get(key string) StoredValue<string> {
	if result := c.client.get(key) {
		data := result.val()
		return StoredValue<string> {
			success: data != ''
			data: data
		}
	}

	return StoredValue<string> {
			success: false
			data: ''
		}
}

pub fn setup() Cache {
	mut config := redis.Options{}

	client := redis.new_client(mut config)
	return Cache{
		client: client
	}
}

