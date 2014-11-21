# Dependencies
gulp           = require "gulp"
browserSync    = require "browser-sync"
minimist       = require "minimist"
shell          = require "gulp-shell"
run_sequence   = require('gulp-run-sequence')


# Configuration
available_arguments =

  # Default values
  default:
    host: 'localhost:4567'
    path: undefined
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
    open:        args.path?
    startPath:   args.path
    ghostMode:   args.ghost
    proxy:       args.host



# Use default task to launch BrowserSync and watch JS files
gulp.task "watch", ["browser-sync"], ->

  # add browserSync.reload to the tasks array to make
  # all browsers reload after tasks are complete.
  gulp.watch "source/**/*", browserSync.reload



gulp.task "build", shell.task [
  "bundle exec middleman build --verbose"
]



gulp.task "publish", ->
  gulp.src("gulpfile.coffee", read: false) # Need to provide a file for the task to start
  .pipe shell(
    [
      'echo "### Adding built files to git index ###"'
      'git add -A'

      'echo "### Commiting changes ###"'
      'git commit -m build'

      'echo "### Pushing the commit to the gh-pages remote branch###"'
      'git push origin gh-pages'
    ],
    cwd: './build/'
  )



gulp.task 'bp', ->
  run_sequence 'build', 'publish'