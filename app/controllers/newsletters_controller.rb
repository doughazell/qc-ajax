class NewslettersController < ApplicationController
  
  def deliver
    QC.enqueue "Newsletter.deliver", params[:id]

    @newsletter = Newsletter.find_by_id(params[:id])

    respond_to do |format|
	    format.html { redirect_to newsletters_url, notice: "Delivering newsletter." }
	    format.js   { poll_update }
    end
  end

  def index
    @newsletters = Newsletter.order("id")
  end
  
  def poll_update
    
    puts "Polling DB update for #{params[:id]}"
    while ! @newsletter.delivered_at.present?
      puts "Sleeping, waiting for #{@newsletter.id}"
      sleep 1
      # 13/3/17 DH: Needs to be reloaded otherwise it will come from the SQL Cache in the same action
      ActiveRecord::Base.connection.query_cache.clear
      @newsletter.reload
    end
    puts "#{params[:id]} now delivered"

    render :reply
  end

end