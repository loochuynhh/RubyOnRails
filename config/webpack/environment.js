const { environment } = require('@rails/webpacker');
const webpack = require('webpack');

environment.config.merge({
  entry: {
    application: './app/javascript/packs/application.js' 
  }
});

environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery'
  })
);

module.exports = environment;
