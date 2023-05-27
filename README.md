# README

### Anything not mentioned here would be present as comments or code in their relevant files.

---

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

1. Created Routes (Short Hand)
   ```
   root "articles#index"

   get 'articles/index'
   ```

   ```
   <HTTP Verb> "<whatever you want your route to be in the url bar>", to: "<controller name>#<method name>", as: :<route helper method name you want>
   ```

   ```
   For Example:
   get "/posts/check_status", to: "articles#status_query", as: :checking_response
   ```

   ```
   This defines a GET route that maps to the status_query action in the ArticlesController when the URL path is /posts/check_status.

   The as: :checking_response option specifies a named route helper method that can be used to generate URLs for this route.

   The helper method is named checking_response, so you can use it in your application code like this:

   checking_response_path #=> "/posts/check_status"

   This will generate the URL for the /posts/check_status route.

   The _path suffix is added automatically by Rails to all named route helpers to distinguish them from URL options that might be passed to the helper method.
   ```

2. Created a Controller 'Articles' with an index page at the moment
   * `bin/rails generate controller Articles index`
3. Created a Model 'Article' with two attributes at the moment
   * `bin/rails generate model Article title:string body:text`
   * `bin/rails db:migrate`
4. Created the rest of the routes for the Article controller
5. Created the corresponding method for those routes
6. Created the corresponding views for those routes
7. Some methods that were used in Views
   1. link_to
      ```
      link_to "<Text to display for the link>", <path helper with may be some params>, <hash containing html attributes to customize the link>, <ruby block to render additional html content>
      ```

      ```
      For Example:

      link_to article.title, article_path(article), { class: "btn btn-primary" }, -> { content_tag(:i, "", class: "fas fa-arrow-circle-right") }

      ```

      ```
      It would look something like this:

      <a href="/articles/1" class="btn btn-primary">Article <i class="fas fa-arrow-circle-right"></i></a>

      ```
   2. Forms
   ```
   Some shorthand version may exists but I don't like using those for better clarity

   # form_with can take both url or model objects as parameters

   form_with model: <single model object or if there is an association, then model objects in an array>, method: :<http verb(put, patch, post)> do |whatever name you want for the form object|
   ```

   ```
   form_with url: <url for the controller>, method: :<http verb(put, patch, post)> do |whatever name you want for the form object|
   ```

   ```
   # form_for does not take url as a parameter, It only take a model object, or model objects

   form_for <single model object or if there is an association, then model objects in an array>, method: :<http verb(put, patch, post)> do |whatever form you want for the form object|
   ```

   ```
   For example: These are all the same:

   form_with model: @user, method: : post do |f|

   form_with url: /users, method: :post do |f|

   form_for @user, method: : post do |f|
   ```
