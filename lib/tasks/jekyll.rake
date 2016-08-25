namespace :jekyll do
  #
  # desc 'Create team file'
  # task :team_file, :id do |t, args|
  #   puts "Getting the team members for Site ##{args[:id]}"
  #   @team_members = HTTParty.get("http://localhost:3000/sites/#{args[:id]}/team_members/render_json")
  #   puts "Writing team members to json data file"
  #   File.open('./themeA/_data/team.json',"w") do |f|
  #     f.write(@team_members.to_json)
  #   end
  # end
  #
  # desc 'Create treatments file'
  # task :treatments_file, :id do |t, args|
  #   puts "Getting the treatments for Site ##{args[:id]}"
  #   @treatments = HTTParty.get("http://localhost:3000/sites/#{args[:id]}/treatments/render_json")
  #   puts "Writing treatments to json data file"
  #   File.open('./themeA/_data/treatments.json',"w") do |f|
  #     f.write(@treatments.to_json)
  #   end
  # end
  #
  # desc 'Create testimonials file'
  # task :testimonials_file, :id do |t, args|
  #   puts "Getting the testimonials for Site ##{args[:id]}"
  #   @testimonials = HTTParty.get("http://localhost:3000/sites/#{args[:id]}/testimonials/render_json")
  #   puts "Writing testimonials to json data file"
  #   File.open('./themeA/_data/testimonials.json',"w") do |f|
  #     f.write(@testimonials.to_json)
  #   end
  # end
  #
  # desc 'Create gallery file'
  # task :gallery_file, :id do |t, args|
  #   puts "Getting the gallery pictures for Site ##{args[:id]}"
  #   @gallery_pictures = HTTParty.get("http://localhost:3000/sites/#{args[:id]}/gallery_pictures/render_json")
  #   puts "Writing gallery pictures to json data file"
  #   File.open('./themeA/_data/gallery.json',"w") do |f|
  #     f.write(@gallery_pictures.to_json)
  #   end
  # end
  #
  # desc 'Create info file'
  # task :info_file, :id do |t, args|
  #   puts "Getting the info for Site ##{args[:id]}"
  #   @info = HTTParty.get("http://localhost:3000/sites/#{args[:id]}/info/render_json")
  #   puts "Writing info to json data file"
  #   File.open('./themeA/_data/info.json',"w") do |f|
  #     f.write(@info.to_json)
  #   end
  # end

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
