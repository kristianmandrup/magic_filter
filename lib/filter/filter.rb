module MagicFilter 

  class << self
    include FilterFactory
  end
  
  def self.chain
    MagicFilter::Chain.new
  end
   
end


