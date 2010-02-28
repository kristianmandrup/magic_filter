module MagicFilter

  class Name < Base    
    attr_accessor :name_matchers, :return_symbol         

    def initialize(name, return_symbol, *name_matchers)
      super name
      @name_matchers = name_matchers       
      @return_symbol = return_symbol
    end

    # reject those not matching, if any left return fx :include or :exclude
    def allow?(name)                                                                          
      return return_symbol if name_matchers.reject{|name_matcher| !name.match(name_matcher) } 
    end
  end
    
end
