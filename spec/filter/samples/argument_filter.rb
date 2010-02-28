module MagicFilter
  # filter on instance variables
  class Argument < Base
    attr_accessor :var_name
      
    def initialize(name, options = {}
      super name, options
      @var_name = options[:arg_name]
    end

    def allow?(*args)                
      msg_in_context? msg = args[0], context = args[1]
    end                
    

  protected
    def msg_in_context?(msg, context)
    obj = context[:args]
    if var_name.kind_of?(Symbol) || var_name.kind_of?(String)
      key = var_name.to_sym
      if obj.has_key? key
        value = obj[key]      
        return name_allow_action(value)
      end
    end
    :yield
    
  end  
end
