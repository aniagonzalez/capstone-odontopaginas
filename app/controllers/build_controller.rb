class BuildController < ApplicationController

  def build_site
    @site = Site.find(params[:id])
    # Rake::Task["jekyll:build"].invoke(params[:id])
    # Rake::Task["jekyll:build"].invoke(4)
    system ("rake jekyll:build[#{params[:id]}]")
    render :show_json
  end

  def show_json
    @site = Site.find(params[:id])
    # @json_datum = JsonDatum.where(site_id: params[:site_id])
    update_team_json
    update_gallery_json
    update_treatments_json
    update_testimonials_json
    update_info_json

  end



  def update_team_json
    @team_members = TeamMember.where(site_id: params[:id])
    # @team_members_json = []
    #
    # @team_members.each do |team_member|
    #   team_member_json = {
    #   :name => team_member.name,
    #   :image => team_member.image,
    #   :email => team_member.email,
    #   :phone => team_member.phone
    #   }
    # @team_members_json << team_member_json
    # end


    # # File.open("public/#{current_user.id}/#{@site.id}/team_member.json","w") do |f|
    # File.open("public/#{current_user.id}-#{@site.id}-team_members.json","w") do |f|
    #   f.write(@team_members_json.to_json)
    # end
    @site = Site.find(params[:id])
    @json_datum = @site.json_datum
    @json_datum.update_attributes(team_json: @team_members.to_a)

    File.open('./themeA/_data/team.json',"w") do |f|
      f.write(@team_members.to_json)
    end
  end

  def update_gallery_json
    @gallery_pictures = GalleryPicture.where(site_id: params[:id])
    @site = Site.find(params[:id])
    @json_datum = @site.json_datum
    @json_datum.update_attributes(gallery_json: @gallery_pictures.to_a)

    File.open('./themeA/_data/gallery.json',"w") do |f|
      f.write(@gallery_pictures.to_json)
    end
  end

  def update_testimonials_json
    @testimonials = Testimonial.where(site_id: params[:id])
    @site = Site.find(params[:id])
    @json_datum = @site.json_datum
    @json_datum.update_attributes(testimonials_json: @testimonials.to_a)

    File.open('./themeA/_data/testimonials.json',"w") do |f|
      f.write(@testimonials.to_json)
    end
  end

  def update_treatments_json
    @treatments = Treatment.where(site_id: params[:id])
    @site = Site.find(params[:id])
    @json_datum = @site.json_datum
    @json_datum.update_attributes(treatments_json: @treatments.to_a)

    File.open('./themeA/_data/treatments.json',"w") do |f|
      f.write(@treatments.to_json)
    end
  end

  def update_info_json
    @site = Site.find(params[:id])
    @json_datum = @site.json_datum
    @json_datum.update_attributes(info_json: @site)

    File.open('./themeA/_data/info.json',"w") do |f|
      f.write(@site.to_json)
    end
  end
end
