desc MagicFilter::Chain do                          
  context "filter chain" do
    let :filters = { MagicFilter.chain }

    it "should add an Argument filter 'my_arg_filter' using << " do
      name_1 = 'my_arg_filter'
      f = filters << :argument, name_1
      f.should be_type(:argument)
      f.should be_named(name_1)

    it "should add an Argument filter 'my_arg_filter' using method_missing " do
      name_1
      filters.argument_filter name_1 do |f|
        f.should be_type(:argument)
        f.should be_named(name_1)
      end
    end  
  
    it "should add filters using method_missing " do
      name_1 = 'my_arg_filter'
      name_2 = 'my method filter'
          # 
      fs = filters.argument_filter(name_1).method_filter(name_2)
      fs.should include(name_1)
      filters.should include(name_1)
      filters.should include(name_2)
    end
    
  end
end     
