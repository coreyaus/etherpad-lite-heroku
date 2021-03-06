# etherpad-lite for heroku

This is a wrapper of etherpad-lite for Heroku, incorporating the official release from upstream as a submodule. (This will hopefully make it easier to keep current.)

## quickstart

1. Set up a Heroku account and configure an app with DB of your choice (default MySQL)
2. Clone this repo into a directory of your choice
3. Set two Heroku config vars:

```bash
heroku config:add DATABASE_URL=urlfromDBprovider
heroku config:add ETHERPAD_SETTINGS=settingsJSONinroot.json
```

4. Copy `settings.json.template` to the filename you gave for `ETHERPAD_SETTINGS` and tweak as needed
5. Add your Heroku app as a remote
6. `git push heroku master`


## additional settings

Etherpad will complain if you run it as root. If you wish to allow it to run as
root, set an additional config variable:

```bash
heroku config:add ETHERPAD_ALLOW_ROOT=1
```


## TODO

- <del>Plugin support</del> Works (manually, see [issue #3](https://github.com/talexand/etherpad-lite-heroku/issues/3#issuecomment-60725329))
- node_modules versioning/locating
- Launch script cleanup

(I welcome pull requests for any of these.)

## due credit

I had to rewrite the launch script on my own, but once I started to understand it, I incorporated lines from [a previous repository](https://github.com/ohwillie/etherpad-lite-heroku).

I got the idea to deconfigure IP/port binding from [the cloudfoundry etherapp repo](https://github.com/cloudfoundry-community/etherpad-lite-cf), which was giving me headache for a little while.
