url shortener built with vlang

To create a link:
```
POST
http://localhost:8081/create

BODY:
{
	"link_url": "https://github.com/",
	"link_name": "hi"
}
```

To go to a link:
```
GET
http://localhost:8081/:link
EXAMPLE:
http://localhost:8081/hi
```

