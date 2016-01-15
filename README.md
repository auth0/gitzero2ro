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

## Issue Reporting

If you have found a bug or if you have a feature request, please report them at this repository issues section. Please do not report security vulnerabilities on the public GitHub issue tracker. The [Responsible Disclosure Program](https://auth0.com/whitehat) details the procedure for disclosing security issues.

## Author

[Auth0](auth0.com)

## License

This project is licensed under the MIT license. See the [LICENSE](LICENSE) file for more info.
