class InputController < ApplicationController
  def first  

  end
  
  def first_input_response 
    respond_to do |format|               
      format.js 
    end 
  end
end