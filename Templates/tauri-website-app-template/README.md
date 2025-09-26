# Tauri Website App

This is a Template which lets you create easily a Tauri app for Website,
**but** this only with Internet because the App is just a redirection!


## To start!

Fork the Repository with **ALL** Branches! *IMPORTANT*

then switch to branch `Tauri-Website-App-Template`
and simply open

```sh
./src/index.html
```

then change the **url** this line which is `https://shadowdara.github.io/`
to another Website

```html
<meta http-equiv="refresh" content="0.0;url=https://shadowdara.github.io/" />
```

then commit the changes on `Tauri-Website-App-Template` and create a tag!

You can just copy the commands down below or run `create_app.sh`

```sh
git checkout Tauri-Website-App-Template
git add .
git commit -m "Initial commit from Tauri Website App Template"
git push
git tag v1.0.0
git push origin v1.0.0
```

The Worklfow will create a new Release version of the Tauri App in the
Repository, this will eventually take a while!


## Other

feel free to fork or contribute to this Repository ;)

### Used Credits:

`create-app.yml`

https://github.com/tauri-apps/tauri-action

The MIT License (MIT)

Copyright (c) 2018 GitHub, Inc. and contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
