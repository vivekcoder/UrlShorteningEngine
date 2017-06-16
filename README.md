# README

This application has two parts: Web and API

after migration task and bundle install, point to localhost:3000

input a long url, for e.g.
	http://google.com/abcderfes

this would get converted to a short url, in this case to "http://google.com/k8gglO"

Now, to test the API, point browser to
	http://localhost:3000/api/v1/urls/convert?original=http://google.com/abcderfes

this would get converted to a short url, in this case to "http://google.com/k8gglO"
