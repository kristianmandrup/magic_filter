module MagicFilter 
  
  def self.list
    MagicFilter::Chain.new
  end
   
  # abstract filter  
  class Basic < Named
    attr_accessor :rules # filter rules for this filter  
    attr_accessor :filters # for nested filters    
    
    def initialize(name, options = {})
      super name
      @rules  = options[:rules] || []     
      @filters  = options[:filters] || []           
    end

    def ===(other)
      return self === other if other.respond_to? :allow?
      name === other.name if other.kind_of? String
      raise "#{other}, is not valid for Filter comparison"
    end
    
    def allow?(name)
      rules.allow?(name)
    end
  end  
end


