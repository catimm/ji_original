class InputController < ApplicationController
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
    video.url = data_parsed["formats"]["video_url"]
    video.completed = data_parsed["formats"]["completed_at"] 

  end
  
end