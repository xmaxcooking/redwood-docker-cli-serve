/** @returns {import('webpack').Configuration} Webpack Configuration */
module.exports = (config, { mode }) => {
  if (mode === 'development') {
    config.devServer = {
      ...config.devServer,
      hot: true,
    }
    config.watchOptions = {
      ...config.watchOptions,
      poll: true,
    }
  }

  return config
}
