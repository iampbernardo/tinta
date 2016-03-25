# load required libraries
gulp    = require 'gulp'
connect = require 'gulp-connect'
sass    = require 'gulp-sass'


# sass compile
gulp.task 'sass', ->
  gulp.src('./src/sass/main.scss')
  .pipe(sass().on('error', sass.logError))
  .pipe(gulp.dest('./dist/css'))

  gulp.src('./src/sass/docs.scss')
  .pipe(sass().on('error', sass.logError))
  .pipe(gulp.dest('./dist/css'))



gulp.task 'sass:watch', ->
  gulp.watch('./src/sass/**/*.scss', ['sass'])


# define tasks
gulp.task 'server', ->
  connect.server({
    root: '.'
    port: 9090,
    livereload: {
      port: 20202
    }
  })

gulp.task 'devel', ['server', 'sass:watch']
