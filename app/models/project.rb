class Project < ActiveRecord::Base

  validates_presence_of :name

  has_many :tasks
  
  def body=(md)
    write_attribute(:body, RDiscount.new(md).to_html)
  end

  def percent_complete
    if self.tasks.count > 0
      (self.tasks.completed.count.to_f / self.tasks.count.to_f) * 100 
    else
      0
    end
    
  end
  
end
