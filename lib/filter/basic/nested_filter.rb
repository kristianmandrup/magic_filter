# abstract filter  
module MagicFilter
  class Nested < Name 
    include Chain

    def ===(other)
      return self === other if other.respond_to? :allow?
      name === other.name if other.kind_of? String
      raise "#{other}, is not valid for Filter comparison"
    end

    # what here?
    def allow?(name)
      if !super.allow
      filters.reject{|f| f.allow? name}  
    end
  end  
end