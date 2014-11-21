@images_path = 'http://hello-baby.github.io/hb_newsletters_middleman/__assets/images/'


# Configuring paths
assets_dir = '__assets'
dirs_hash = {
  css_dir:      'stylesheets',
  js_dir:       'javascripts',
  images_dir:   'images',
  layouts_dir:  '_layouts',
  partials_dir: '_components'
}
dirs_hash.each_pair do |key, value|
  set key, File.join(assets_dir, value)
end


# Ignoring files
set :file_watcher_ignore,[
                          /^bin\//,
                          /^\.bundle\//,
                          /^vendor\//,
                          /^\.sass-cache\//,
                          /^\.cache\//,
                          /^\.git\//,
                          /^\.gitignore$/,
                          /\.DS_Store/,
                          /^\.rbenv-.*$/,
                          /^\.idea\//,
                          /^Gemfile$/,
                          /^Gemfile\.lock$/,
                          /^Gruntfile\.js$/,
                          /^package\.json$/,
                          /^[a-zA-Z0-9_-]+\.iml$/,
                          /~$/,
                          /(^|\/)\.?#/,
                          /^tmp\//,
                          /^build\//,
                          /^\.bowerrc\//,
                          /^bower_components\//,
                          /^node_modules\//
                        ]


# Use relative URLs
set :relative_links, true
activate :relative_assets