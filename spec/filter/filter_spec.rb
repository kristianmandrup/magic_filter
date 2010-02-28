# FILTERS

desc MagicFilter do                          
  context "initial"
    it "should return an empty chain filter 'my chain filter'" do
      name_1 = 'my chain filter'
      filter = MagicFilter.chain name_1
      filter.should be_named(name_1)      
      filter.should be_type(:chain)
      filter.filters.should be_empty      
    end

    it "should return an argument filter 'my_arg' using method_missing" do                                
      name_1 = 'my_arg'
      f = MagicFilter.argument_filter 
      f.should be_type(:argument)         
      f.should be_named(name_1)           
      f.filters.should be_empty            
    end

    it "should return an argument filter 'my_arg' using <<" do                                
      name_1 = 'my_arg'
      f = MagicFilter << :argument 
      f.should be_type(:argument)         
      f.should be_named(name_1)           
      f.filters.should be_empty            
    end

  end
  
end
