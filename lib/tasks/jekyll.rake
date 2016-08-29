require 'aws-sdk'
require 'fileutils'

namespace :jekyll do

  desc 'Build jekyll site and delete files'
  task :build2, :id do |t, args|
    puts "Building jekyll site"
    sh "cd themeA && jekyll build --destination ../built_sites/#{args[:id]}"
    sh "open built_sites/#{args[:id]}/index.html"
    # File.delete('./themeA/_data/gallery.json') if File.exist?('./themeA/_data/gallery.json')
    # File.delete('./themeA/_data/team.json') if File.exist?('./themeA/_data/team.json')
    # File.delete('./themeA/_data/testimonials.json') if File.exist?('./themeA/_data/testimonials.json')
    # File.delete('./themeA/_data/treatments.json') if File.exist?('./themeA/_data/treatments.json')
    # File.delete('./themeA/_data/info.json') if File.exist?('./themeA/_data/info.json')
  end

  desc 'upload css'
  task :s3css do
    s3 = Aws::S3::Resource.new(region:'us-west-2')
    bucket = s3.bucket('capstone-sites').object('main.css')
    bucket.upload_file('./built_sites/1/css/main.css')
  end


  desc 'upload ALL js'
  task :s3js do
    s3 = Aws::S3::Resource.new(region:'us-west-2')
    obj1 = s3.bucket('capstone-sites').object('js/all.min.js')
    obj1.upload_file('./built_sites/1/js/all.min.js')
    obj2 = s3.bucket('capstone-sites').object('js/all.js')
    obj2.upload_file('./built_sites/1/js/all.js')
    obj3 = s3.bucket('capstone-sites').object('js/bootstrap.js')
    obj3.upload_file('./built_sites/1/js/bootstrap.js')
    obj4 = s3.bucket('capstone-sites').object('js/custom.js')
    obj4.upload_file('./built_sites/1/js/custom.js')
    obj5 = s3.bucket('capstone-sites').object('js/gmap3.js')
    obj5.upload_file('./built_sites/1/js/gmap3.js')
    obj6 = s3.bucket('capstone-sites').object('js/jquery.magnific-popup.js')
    obj6.upload_file('./built_sites/1/js/jquery.magnific-popup.js')
    obj7 = s3.bucket('capstone-sites').object('js/owl.carousel.js')
    obj7.upload_file('./built_sites/1/js/owl.carousel.js')
  end

  desc 'upload some file'
  task :s3site do
    s3 = Aws::S3::Resource.new(region:'us-west-2')
    bucket = s3.bucket('capstone-sites').object('site1')
    bucket.upload_file('./built_sites/1/index.html')
    # https://s3-us-west-2.amazonaws.com/capstone-sites/site1
  end

  desc 'Build jekyll site and delete files'
  task :build, :id do |t, args|
    puts "Building jekyll site"
    sh "cd themeA && jekyll build --destination ../built_sites"
    # sh "open built_sites/#{args[:id]}/index.html"
    File.delete('./themeA/_data/gallery.json') if File.exist?('./themeA/_data/gallery.json')
    File.delete('./themeA/_data/team.json') if File.exist?('./themeA/_data/team.json')
    File.delete('./themeA/_data/testimonials.json') if File.exist?('./themeA/_data/testimonials.json')
    File.delete('./themeA/_data/treatments.json') if File.exist?('./themeA/_data/treatments.json')
    File.delete('./themeA/_data/info.json') if File.exist?('./themeA/_data/info.json')

    s3 = Aws::S3::Resource.new(region:'us-west-2')
    bucket = s3.bucket('capstone-sites').object("site#{args[:id]}")
    bucket.upload_file('./built_sites/index.html')
    FileUtils.rm_rf('./built_sites')
    # https://s3-us-west-2.amazonaws.com/capstone-sites/site1
  end




end
