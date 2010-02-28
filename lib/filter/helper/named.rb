module MagicFilter
  class Named     
    attr_reader :name
        
    def initialize(name)
      @name = name || "Unknown"    
  end
end
  