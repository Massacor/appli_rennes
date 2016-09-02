module.exports = function(grunt) {

	// Load the plugin that provides the "uglify" task.
	grunt.loadNpmTasks('grunt-contrib-uglify');

	//Plugin for concat
	grunt.loadNpmTasks('grunt-contrib-concat');

	//Plugin for pug compile
	grunt.loadNpmTasks('grunt-contrib-pug');

	//Plugin for jshint
	grunt.loadNpmTasks('grunt-contrib-jshint');

	//Plugin for sass
	grunt.loadNpmTasks('grunt-contrib-sass');

	

	// Project configuration.
	grunt.initConfig({

		//Json task	
		pkg: grunt.file.readJSON('package.json'),

		//Uglify tasks

		uglify: {
			options: {
			  banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd") %> */\n'
			},
			build: {
			  src: 'src/<%= pkg.name %>.js',
			  dest: 'build/<%= pkg.name %>.min.js'
			}
		},

		//Pug task
		pug: {
			options: {
				pretty: true,
				data: function(dest, src) {
					return {
						from: "web/assets/pug_files/",
						dist: "web/pages/"
					}
				},
			}
		}

	});


	//Create tasks
	grunt.registerTask('default', ['pug']);




};