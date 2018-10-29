# Phoenix/Elixir page specific JavaScript structure

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `cd .. && mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## JavaScript structure

  * page specific functionality is stored in individual files located in assets/js/
  * there is one file for every page
  * assets/js/app.js contains an import for each page file
  * lib/bikeshop_web/templates/layout/app.html.eex establishes the namespace when it requires js/app
  * calls are made via the namespace bikeshop.page.
  ### adding page with JavaScript
  
1. create page template with JavaScript call
  
    ```bash
    vi lib/bikeshop_web/templates/page/lorem.html.eex
    ```
    ```html
    <script>bikeshop.page.lorem.heartbeat();</script>
    ```

1. create heartbeat function in assets/js/lorem.js

    ```javascript  
    export const heartbeat = () => {console.log("heartbeat from lorem");};
    ```

1. add import and update page in assets/js/app.js

    ```javascript  
    import * as lorem from "./lorem"
    export const page = {show: show, index: index, lorem: lorem}
    ```

1. update lib/bikeshop_web/templates/layout/app.html.eex require statement
    ```javascript  
    var bikeshop = require("js/app");
    ```
