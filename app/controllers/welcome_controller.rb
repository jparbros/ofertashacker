class WelcomeController < ApplicationController
  
  def index
    @jobs = Job.find(:all, :order => "id DESC")
    @jobs = @jobs.paginate :page => params[:page], :per_page => 8
  end
  
  def about
  
  end
  
  def contact
  
  end

end
