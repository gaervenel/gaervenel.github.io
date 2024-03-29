# Somebody is using deprecated URI methods, which is cluttering my output
require 'warning'
Warning.ignore(/URI.*escape is obsolete/)

# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

#activate :autoprefixer do |prefix|
#  prefix.browsers = "last 2 versions"
#end

set :slim, tabsize: 2

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/worksheets/*', layout: 'worksheet'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# https://middlemanapp.com/basics/helper-methods/
set :helpers_dir, 'lib/helpers'

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

# configure :build do
#   activate :minify_css
#   activate :minify_javascript
# end

set :build_dir, 'docs'
# Need to clean up .git repositories from submodules in build output
after_build do |builder|
  builder.thor.run 'rm -rf docs/fonts/5e/.git'
end
