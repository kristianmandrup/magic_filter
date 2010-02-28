module MagicFilter
  class Base < Named
    include FilterFactory
  
    def allow?(name)
      true
    end
  end
end