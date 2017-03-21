class Newsletter < ActiveRecord::Base

  # 21/3/17 DH: No mass assignment allowed for Rails 5 with gem 'protected_attributes', now done in Controller
  #             https://github.com/rails/strong_parameters
  # ...however this is just to provide Model attribute access to the View
  #    http://blog.bigbinary.com/2016/05/17/rails-5-moved-assign-attributes-from-activerecord-to-activemodel.html
    
  # 21/3/17 DH: Adding 'attr_accessor' prevented access to Model attributes...???
  #include ActiveModel::AttributeAssignment
  #include ActiveModel::AttributeMethods
  #attr_accessor :delivered_at, :subject
  
  # 21/3/17 DH: Orig Rails 3.2.3 code:
  #attr_accessible :delivered_at, :subject
  
  def self.deliver(id)
    newsletter = find(id)
    # raise "Oops"
    puts "Sleeping for 5 secs to simulate long delivery..."
    sleep 5 # simulate long newsletter delivery
    newsletter.update_attribute(:delivered_at, Time.zone.now)
  end
   
end
