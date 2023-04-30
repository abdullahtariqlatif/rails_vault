# README
1. Packages Version Manager
   * asdf
     * 0.11.3-0adc6c1
2. Ruby version
   * 2.7.8
3. Rails version
   * 6.1.7.3
4. NodeJS version
   * 16.18.0
5. Yarn version
   * 1.22.19
6. Database
   * sqlite3
     * 1.4
7. Webpacker
   * 5.0
8. Bootstrap
   * 4.6.2
9. PopperJS
   * 1.16.1
10. JQuery
    * 3.6.4
11. Turbolinks
    * 5

&nbsp;

---

&nbsp;

1. Installed Bootstrap 4-latest (4.6.2) using:
   * `yarn add bootstrap@latest-4`
   * https://classic.yarnpkg.com/en/package/bootstrap

2. Installed PopperJS latest (1.16.1) using:
   * `yarn add popper.js@latest`
   * https://classic.yarnpkg.com/en/package/popper.js

3. Installed JQuery latest (3.6.4) using:
   * `yarn add jquery@latest`
   * https://classic.yarnpkg.com/en/package/jquery

4. Open config/webpack/environment.js and add the following lines:

  ```
  const { environment } = require('@rails/webpacker')
  const webpack = require("webpack")

  environment.plugins.append("Provide", new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  }))

  module.exports = environment

  ```

5. Rename app/assets/stylesheets/application.css to app/assets/stylesheets/application.scss.

6. Open app/assets/stylesheets/application.scss and add the following line at the top:

   `@import 'bootstrap';`

7. In app/javascript/packs/application.js, remove any existing require statements related to jQuery, Popper.js, and Bootstrap.

&nbsp;

---

&nbsp;
