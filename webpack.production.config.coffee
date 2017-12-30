path = require('path')
webpack = require('webpack')
module.exports =
  entry: app: [ './src/scripts/router' ]
  devtool: 'source-map'
  output:
    path: path.join(__dirname, 'public')
    filename: 'bundle.js'
  resolveLoader: modulesDirectories: [
    '..'
    'node_modules'
  ]
  plugins: [
    new (webpack.DefinePlugin)('process.env': NODE_ENV: JSON.stringify('production'))
    new (webpack.IgnorePlugin)(/vertx/)
    new (webpack.IgnorePlugin)(/un~$/)
    new (webpack.optimize.DedupePlugin)
    new (webpack.optimize.UglifyJsPlugin)
  ]
  resolve: extensions: [
    ''
    '.js'
    '.cjsx'
    '.coffee'
  ]
  module: loaders: [
    {
      test: /\.css$/
      loaders: [
        'style'
        'css'
      ]
    }
    {
      test: /\.cjsx$/
      loaders: [
        'coffee'
        'cjsx'
      ]
    }
    {
      test: /\.coffee$/
      loader: 'coffee'
    }
  ]
