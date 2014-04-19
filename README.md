# GitZero

![ss-2014-04-19T20-33-25.png](https://s3.amazonaws.com/blog.auth0.com/ss-2014-04-19T20-33-25.png)


This is the Auth0 fork of [Grack - Rack Git Smart-HTTP Server](https://github.com/schacon/grack).

It adds support for token-based authentication.

To clone/pull/push from a gitzero repository, you need to first open the url in a browser and login with whatever identity provider you have configured in Auth0:

![ss-2014-04-19T20-34-10.png](https://s3.amazonaws.com/blog.auth0.com/ss-2014-04-19T20-34-10.png)

Then you will get a token:

![ss-2014-04-19T20-34-41.png](https://s3.amazonaws.com/blog.auth0.com/ss-2014-04-19T20-34-41.png)

You can use this token in your upstream operations as follows:

~~~
$ git push https://<token>:@myserver.com/
~~~

Use the __token__ as the username and leave the password empty.

## Configuration

You need three env variables:

-  AUTH0_NAMESPACE
-  AUTH0_CLIENT_ID
-  AUTH0_CLIENT_SECRET

## Running

You can use rackup or any ruby http server directly.

```
$ rackup
```

## License

	(The MIT License)

	Copyright (c) 2014 Auth0, Inc <support@auth0.com>

	Permission is hereby granted, free of charge, to any person obtaining
	a copy of this software and associated documentation files (the
	'Software'), to deal in the Software without restriction, including
	without limitation the rights to use, copy, modify, merge, publish,
	distribute, sublicense, and/or sell copies of the Software, and to
	permit persons to whom the Software is furnished to do so, subject to
	the following conditions:

	The above copyright notice and this permission notice shall be
	included in all copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
	EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
