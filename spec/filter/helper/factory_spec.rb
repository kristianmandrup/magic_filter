desc MagicFilter::Factory do                          
  let :factory = { MagicFilter::Factory }

  it "should create an Argument filter 'my_arg_filter' using << " do
    filter = filters << :argument, 'my_arg_filter'
    filter.should == be_type(:argument)
    filter.should == be_named('my_arg_filter')

  it "should create an Argument filter 'my_arg_filter' using method_missing " do
    filters.argument_filter 'my_arg_filter' do |filter|
      filter.should == be_type(:argument)
      filter.should == be_named('my_arg_filter')
    end
  end
    
end