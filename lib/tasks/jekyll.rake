namespace :jekyll do

  desc 'Build jekyll site and delete files'
  task :build, :id do |t, args|
    puts "Building jekyll site"
    sh "cd themeA && jekyll build --destination ../built_sites/#{args[:id]}"
    sh "open built_sites/#{args[:id]}/index.html"
    File.delete('./themeA/_data/gallery.json') if File.exist?('./themeA/_data/gallery.json')
    File.delete('./themeA/_data/team.json') if File.exist?('./themeA/_data/team.json')
    File.delete('./themeA/_data/testimonials.json') if File.exist?('./themeA/_data/testimonials.json')
    File.delete('./themeA/_data/treatments.json') if File.exist?('./themeA/_data/treatments.json')
    File.delete('./themeA/_data/info.json') if File.exist?('./themeA/_data/info.json')
  end

end
