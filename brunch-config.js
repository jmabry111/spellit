exports.config = {
  files: {
    javascripts: {
      joinTo: "js/app.js"

    },
    stylesheets: {
      joinTo: "css/app.css"
    },
    templates: {
      joinTo: "js/app.js"
    }
  },

  conventions: {
    // This option sets where we should place non-css and non-js assets in.
    // By default, we set this to "/web/static/assets". Files in this directory
    // will be copied to `paths.public`, which is "priv/static" by default.
    assets: /^(web\/static\/assets)/
  },

  // Phoenix paths configuration
  paths: {
    // Dependencies and current project directories to watch
    watched: [
      "web/static",
      "test/static"
    ],

    // Where to compile files to
    public: "priv/static"
  },

  // Configure your plugins
  plugins: {
    babel: {
      ignore: [/web\/static\/vendor/]
    },
    sass: {
      options: {
        includePaths: [
          "node_modules/bourbon/core",
          "node_modules/normalize.css",
          "node_modules/selectize/dist/css"
        ]
      },
    },  
  },

  modules: {
    autoRequire: {
      "js/app.js": ["web/static/js/app"]
    }
  },

  npm: {
    enabled: true,
    globals: {$: 'jquery', jQuery: 'jquery'},
  }
};
