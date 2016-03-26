# load required libraries
gulp         = require 'gulp'
connect      = require 'gulp-connect'
sass         = require 'gulp-sass'
postcss      = require 'gulp-postcss'
autoprefixer = require 'autoprefixer'
uglify       = require 'gulp-uglify'
cssmin       = require 'gulp-cssmin'
rename       = require 'gulp-rename'


# sass compile
gulp.task 'sass', ->

  processors = [
    autoprefixer({browsers: ['last 3 versions']})
  ]

  gulp.src('./src/sass/main.scss')
  .pipe(sass().on('error', sass.logError))
  .pipe(postcss(processors))
  .pipe(gulp.dest('./dist/css'))
  .pipe(cssmin())
  .pipe(rename({suffix: '.min'}))
  .pipe(gulp.dest('./dist/css'))


  gulp.src('./src/sass/docs.scss')
  .pipe(sass().on('error', sass.logError))
  .pipe(postcss(processors))
  .pipe(cssmin())
  .pipe(rename({suffix: '.min'}))
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

gulp.task 'devel', ['sass','server', 'sass:watch']
