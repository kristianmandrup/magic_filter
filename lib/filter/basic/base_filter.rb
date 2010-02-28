module MagicFilter
  class Base < Named
    include FilterFactory

    def type
      self.to_s.downcase.to_sym
    end
  
    def allow?(name)
      true
    end
  end
end
