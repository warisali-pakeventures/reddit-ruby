const {environment} = require('@rails/webpacker')
const coffee =  require('./loaders/coffee')

//
// environment.plugins.append('Provide',
//     new webpack.ProvidePlugin({
//         $: 'jquery',
//         jQuery: 'jquery',
//         jquery: 'jquery',
//     })
// )

// environment.plugins.append('Provide', new webpack.ProvidePlugin({
//     $: 'jquery',
//     jQuery: 'jquery',
// }))

environment.loaders.prepend('coffee', coffee)
module.exports = environment
