dep('node') { requires 'node.bin', 'npm.bin' }
dep('bower') { requires 'node', 'bower.npm' }

dep 'node.bin'
dep 'npm.bin'

dep 'bower.npm'
dep 'ember-cli.npm'
dep('coffee-script.npm') { provides 'coffee' }
