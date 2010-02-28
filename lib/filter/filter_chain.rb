module MagicFilter
  class Chain < Named
    include Enumerable
    attr_accessor :filters      
 
    def initialize(name = '', filters = [])
      super name
      @filters = filters
    end
    

    # concatenate to filters chain either using a hash with parameters for a single filter
    # or using a lits of reay made filters
    # example: list << f1, f2 

    # alternative
    # list << {:argument, 'name', {..}} - here :arg is used to look up a class MagicFilters::Argument, and calling new with the remaining arguments
    
    def << (*filters)
      filters.each{|filter| add(filter) }
    end

    def remove(*filters)
      filters.each{|filter| delete filter}
    end
    
    def each
      filters.each{|filter| yield filter}
    end
    
  protected

    def add(filter)
      return add_hash(filters) if filter.kind_of? Hash            
      @filters << filter if filter.respond_to? :allow? 
      return self
    end

    # raise exception if no class found
    def add_hash(hash)                        
      return add "MagicFilter::#{clazz = hash[0]}".to_class.new [*hash[1..-1]]
    end
      
    def delete(filter)
      filters.delete filter        
    end
    
  end
end
