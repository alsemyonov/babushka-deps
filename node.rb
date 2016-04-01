# https://nodejs.org/

dep 'common node' do
  requires 'nodejs.bin'
end

dep 'production node' do
  requires 'common node'
end

dep 'development node' do
  requires 'common node'

  # System utilities
  requires 'mehserve.npm'

  # Development helpers
  requires 'bower.npm'
  requires 'phantomjs-prebuilt.npm'
  requires 'csscomb.npm'
  requires 'jscs.npm'
  requires 'jshint.npm'
  requires 'jslint.npm'
  requires 'eslint.npm'

  # My preferences
  requires 'ember-cli.npm'
end

## npm packages:

# http://bower.io/
# Bower — a package manager for the web
dep('bower.npm') { provides 'bower' }

# http://ember-cli.com/
# The command line interface for ambitious web applications.
dep('ember-cli.npm') { provides 'ember' }

# https://github.com/timecounts/mehserve
# A simple port-sharing proxy for development on multiple local domains, supports websockets
dep('mehserve.npm') { provides 'mehserve' }

# http://phantomjs.org/
# Headless WebKit scriptable with a JavaScript API
dep('phantomjs-prebuilt.npm') { provides 'phantomjs' }
dep('phantomjs') { requires 'phantomjs-prebuilt.npm' }

# http://csscomb.com/
# CSS Code Style
dep('csscomb.npm') { provides 'csscomb' }

# http://jscs.info/
# JavaScript Code Style
dep('jscs.npm') { provides 'jscs' }

# http://jshint.com/
# A Static Code Analysis Tool for JavaScript
dep('jshint.npm') { provides 'jshint' }

# http://www.jslint.com/
# The JavaScript Code Quality Tool
dep('jslint.npm') { provides 'jslint' }

# http://eslint.org/
# The pluggable linting utility for JavaScript and JSX
dep('eslint.npm') { provides 'eslint' }

# Converters
dep('coffee-script.npm') { provides 'coffee' }
dep('less2sass.npm')

dep('sassdoc.npm')
