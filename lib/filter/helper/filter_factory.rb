module MagicFilter
  module Factory 
    
    # create and add from method name
    def method_missing(name, *args)
      if filter_name = name.to_s.gsub!(/_filter$/)
        self << "MagicFilter::#{filter_name}".to_class.new args
      else
        raise "class MagicFilter::#{name} was not found"
      end
    end 
    
    # concatenate to filters chain either using a hash with parameters for a single filter
    # or using a lits of reay made filters
    # example: list << f1, f2 

    # alternative
    # list << {:argument, 'name', {..}} - here :arg is used to look up a class MagicFilters::Argument, and calling new with the remaining arguments
    
    def << (*filters)
      filters.each{|filter| add(filter) }
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
                  
  end
end
    