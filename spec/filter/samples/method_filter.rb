module Filter
  # filter on method
  class Method < Name
    # uses options to setup name filter, with include/exclude
    def initialize(name, *options)
      super
    end

    def allow?(*args)                
      msg_in_context? msg = args[0], context = args[1]
    end                

    # extract method name from context
    # apply name filter using method name as name!
    def msg_in_context?(msg, context)      
      super.allow? name = context[:method_name]
    end
  end
end
