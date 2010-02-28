module MagicFilter 

  class << self
    include FilterFactory
  end
  
  def self.list
    MagicFilter::Chain.new
  end
   
end


