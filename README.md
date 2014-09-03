# Simple Hook
The app extend `Plack::App::GitHub::WebHook`.

## Flow
Github(POST) -> Plack::App::Github::WebHook -> shell commands
### Installation
1. git clone 
2. cpanm Dist::Zilla && dzil listdeps | cpanm

### Setting the App
Please check web-hook.yaml

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
