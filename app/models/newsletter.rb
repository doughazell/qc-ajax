class Newsletter < ActiveRecord::Base
  attr_accessible :delivered_at, :subject
  
  def self.deliver(id)
    newsletter = find(id)
    # raise "Oops"
    puts "Sleeping for 5 secs to simulate long delivery..."
    sleep 5 # simulate long newsletter delivery
    newsletter.update_attribute(:delivered_at, Time.zone.now)
  end
   
end
