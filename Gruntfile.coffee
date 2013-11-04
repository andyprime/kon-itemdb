module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON('package.json')

    coffee:
      options: 
        join: true
      compile: 
        files:
          'js/compiled.js': 'src/*.coffee'

    hogan:
      target:
        templates: 'coffee/templates/*.hogan'
        output: 'js/templates.js'

    less:
      dev:
        # options:
        #   paths: ['src/less']
        files: 
          'styles.css': 'src/less/main.less'

  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-hogan')
  grunt.loadNpmTasks('grunt-contrib-less')

  grunt.registerTask('hogan', ['hogan'])

  grunt.registerTask('default', ['coffee', 'hogan', 'less'])
