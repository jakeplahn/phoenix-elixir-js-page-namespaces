# BikeShop

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## JavaScript structure

  * page specific functionality is stored in individual files located in assets/js/
  * there is one file for every page
  * assets/js/app.js contains an import for each page file
  * lib/bikeshop_web/templates/layout/app.html.eex establishes the namespace when it requires js/app
  * calls are made via the namespace bikeshop.page.
  ### adding page with JavaScript
  
  * create lib/bikeshop_web/templates/page/lorem.html.eex, add markup, add JavaScript call
  ```javascript
bikeshop.page.lorem.heartbeat()
```
  * create heartbeat function in assets/js/lorem.js
  ```javascript  
export const heartbeat = () => {console.log("heartbeat from lorem");};
```
  * add import and update page in assets/js/app.js
  ```javascript  
import * as lorem from "./lorem"
export const page = {show: show, index: index, lorem: lorem}
```
  * update lib/bikeshop_web/templates/layout/app.html.eex require statement
  ```javascript  
var bikeshop = require("js/app");
```
