# GitZero - Username and Password authentication

This is an Auth0 fork of [Grack - Rack Git Smart-HTTP Server](https://github.com/schacon/grack).

It authenticate users with username and password. This works for some connection types:

- __Database Connections__
- __Active Directory connections__

If you need to use another type of authentication provider check [GitZero](http://github.com/auth0/gitzero).

To clone/pull/push a user must use their real username and password credentials.

## Example: cloning

~~~bash
~/Projects » git clone http://my-gitzero-ro-server.com/my-project
Cloning into 'my-project'...
Username for 'http://my-gitzero-ro-server.com/my-project': my-ad-username
Password for 'http://my-ad-username@localhost:9292': my-ad-password
~~~

## Configuration

You need three env variables:

-  AUTH0_NAMESPACE
-  AUTH0_CLIENT_ID
-  AUTH0_CONNECTION

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
