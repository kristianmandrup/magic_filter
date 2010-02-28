module MagicFilter

  class Range < Base    
    attr_accessor :ranges, :return_symbol         

    def initialize(name, return_symbol, *ranges)
      super
      @ranges = ranges       
      @return_symbol = return_symbol
    end

    # reject those not matching, if any left return fx :include or :exclude
    def allow?(value)
      return return_symbol if ranges.reject{|range| !range.include?(value) }
    end
  end  
    
end
