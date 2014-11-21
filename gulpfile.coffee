# Dependencies
gulp           = require "gulp"
browserSync    = require "browser-sync"
minimist       = require "minimist"



# Configuration
available_arguments =

  # Default values
  default:
    host: 'localhost:4567'
    path: ''
    mode: false

  # What arguments to treat as strings
  string: [
    'path'
    'host'
  ]



# Preparation
args = minimist process.argv.slice(2), available_arguments



# Start BrowserSync
gulp.task "browser-sync", ->
  browserSync
    open:      args.path?
    startPath: args.path
    ghostMode: args.ghost
    proxy:     args.host


# Use default task to launch BrowserSync and watch JS files
gulp.task "default", ["browser-sync"], ->

  # add browserSync.reload to the tasks array to make
  # all browsers reload after tasks are complete.
  gulp.watch "*.html", browserSync.reload
