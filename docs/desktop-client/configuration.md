# Custom configuration
Add your configuration in `config/env_[CONTEXT].json` (usuallly config/env_production.json)

The following configuration options are available:

* `name` String (optional) - the name of the context. `production` or `development`. Default: `production`
* `version` Integer (optional) - version of this configuration (Increase if you want to update env configuration between build updates). Default: `0`
* `tlsVerifyCert` Boolean (optional) - Accept self signed SSl certificates. Default: `true` on development, `false` on production
* `blnUrl` String (optional) - the url under which your Balloon installation is running. If no set user is prompted to enter URL on first start (eg: `https://example-balloon.io`)
* `apiPath` String (optional) - the path to the API Default: `'/api/v1/'`
* `configDir` String (optional) - path to the directory where configuration is stored on the client. You can use {home}/{username} which gets replaced with the current home directory/local username. This setting only works well if update.enable is set on `false`. Default: `{home}/.balloon`
* `configFileName` String (optional) - name of the configuration file inside `configDirName`. Default: `config.json`
* `balloonDir` String (optional) - default path to the directory where the synced files are saved. You can use {home}/{username} which gets replaced with the current home directory/local username. Default: `{home}/Balloon`
* `log` Object (optional) - logging configuration
  * `level` String (optional) - maximum level that should be logged. Default: `debug`. Available levels: `{error: 3, warning: 4, notice: 5, info: 6, debug: 7}`
  * `maxsize` Integer (optional) - maximum size of a single lg file. Default: `10000000`
  * `maxFiles` Integer (optional) - maximum number of log files. Default: `10`
* `requestTimeout` Integer (optional) - api request timeout in miliseconds. Default: `30000`
* `sync`: Object (optional) - sync configuration
  * `interval` Integer (optional) - interval in which syncs run in production context. Default: `5`
  * `maxConcurentConnections` Integer (optional) - maximum simultaneous connections for file up- and downloads
* `enableAutoLaunch` Boolean (optional) - if app should be launched on system startup. Default: true
* `allowPrerelease` Boolean (optional) - if auto updater should install pre releases. Default: false
* `update` Object (optional) - update configuration
  * `enable` Boolean (optional) - enables automatic (and manual) updates - Default: `true`
  * `checkInterval` Integer (optional) - interval in hours the client should check for updates. A first check is always done on app start. Default: `4`
* `winClsId` String (optional) - Windows explorer ClsId
* `auth`: Object (optional) - authentication configuration
  * `secretStorage` String (optional) - credential storage, either config or keytar (OS keychain). Default: `keytar`
  * `credentials` null|'basic'|'token' - if `null` only oidc auth is active, `token` for internal token flow, `basic` for basic authentication. Be sure your server supports the configured authentication method. Default: `token`
  * `oidc` Array (optional) - configure multiple OpenID-connect provider, be sure that your server also supports those oidc provider
    * `clientId` String (required) client id
    * `clientSecret` String (required) client secret
    * `providerUrl` String (required) URL to the discovery document
    * `redirectUri` String (required) redirect uri to local http port (for example: http://127.0.0.1:13005)
    * `revokeAuthenticationRequired` Boolean (otional) should be false if the /revoke endpoint does not require client authentication. Default: `true`
    * `scope` String (required) OAUTH2 scopes (For example: openid profile)
    * `imgBase64` String (required) base64 encoded Oidc sign-in button
* `autoReport` Boolean (optional) - If true report will be sent every `autoReportInterval` to `autoReportPutUrl` Default: `false`
* `autoReportPutUrl` String (optional) - Url to which to send auto reports
* `autoReportInterval` Integer (optional) - Interval to send auto reports in milliseconds. Default: `300000`
