# Simple Hook
The app intendedly extends `Plack::App::GitHub::WebHook` in order to simply set all things up  through a configuration file, no need to code anymore. :)

## Flow
Github(POST) -> Plack::App::Github::WebHook -> shell commands
### Installation
```
> git clone git@github.com:heytitle/simple-hook.git && cd simple-hook
> cpanm Dist::Zilla && dzil listdeps | cpanm
```

### Setting the App
Please check `webhook.yaml`

**NOTE:** All commands will be combined by `&&`

### Setting on Github
Follow this instruction https://developer.github.com/webhooks/creating

1. Make sure your payload url is correct and accessible from outside.
2. `Content Type` should be `application/x-www-form-urlencoded`

### Usage
Start service
```
plackup app.psgi
```
**NOTE** `last-update.txt` will be updated everytime when new code is pushed.
