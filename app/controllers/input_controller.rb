class InputController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def first  
   
  end
  
  def first_input_response 
    respond_to do |format|               
      format.js 
    end 
  end
  
  def video_url
    information = request.raw_post
    data_parsed = JSON.parse(information)
    
    video = Video.new
    video.uuid = data_parsed["uuid"]
    video.completed = data_parsed["created_at"]
    
    if video.save
      @video = video
    end 

  end
  
end