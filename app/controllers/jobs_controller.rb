class JobsController < ApplicationController  
  def show
    @job=Job.published.find(params[:id])
  end
end
