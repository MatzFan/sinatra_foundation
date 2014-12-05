require 'bundler'
Bundler.require :default, ENV['RACK_ENV'].to_sym # requires all gem files :)

class App < Sinatra::Application
  set :root, File.dirname(__FILE__)

  register Sinatra::AssetPack

  assets do
    serve '/js', from: 'vendor/js'
    serve '/bower_components', from: 'vendor/bower_components'

    js :modernizr, [
      '/bower_components/modernizr/modernizr.js',
    ]

    js :libs, [
      '/bower_components/jquery/dist/jquery.js',
      '/bower_components/foundation/js/foundation.js'
    ]

    js :application, [
      '/js/app.js'
    ]

    js_compression :jsmin
  end

  get '/' do
    @msg = 'Hello World'
    erb :layout
  end

end
