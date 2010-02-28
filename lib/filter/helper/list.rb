module MagicFilter
  module List 
    include Enumerable
    attr_accessor :filters      

    def initialize(name = '', filters = [])
      super name
      @filters = filters
    end

    def remove(*filters)
      filters.each{|filter| delete filter}
    end

    def each
      filters.each{|filter| yield filter}
    end
    
    def delete(filter)
      filters.delete filter        
    end
  end
end
