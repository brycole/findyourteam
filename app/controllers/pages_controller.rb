class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    lol = "lol_group_battle.mp4"
    dota2 = "dota2_blackhole.mp4"
    @video = lol

    #config.assets.paths << "#{Rails.root}/app/assets/videos"
    # <video autoplay="autoplay" loop="loop" muted="muted" src="<%= @video %>"></video>
    # <%= video_tag "dota2_blackhole.mp4" %>
  end

end
