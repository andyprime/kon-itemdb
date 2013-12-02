module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffee:
      options: 
        join: true
        bare: true
      compile: 
        files:
          'js/compiled.js': ['src/*.coffee', 'src/models/*.coffee']

    hogan:
      mytarget:
        templates: 'src/templates/*.hgn'
        output: 'js/templates.js'
        binderName: 'hulk'

    less:
      dev:
        files: 
          'styles.css': 'src/less/main.less'

    watch:
      coffee:
        files: ['src/*.coffee']
        tasks: 'default'

      hogan:
        files: ['src/**/*.hgn']
        tasks: 'hogan'

      less:
        files: ['src/**/*.less']
        tasks: 'less'

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-hogan')
  grunt.loadNpmTasks('grunt-contrib-less')
  grunt.loadNpmTasks('grunt-contrib-watch')

  grunt.registerTask('default', ['coffee', 'hogan', 'less'])
