class String  
  def to_class
    class_name = self
    class_name.split(‘::’).inject(Kernel) {|scope, const_name| scope.const_get(const_name)}  
  end
end    
