Spec::Matchers.define :be_named do |expected|
  match do |actual|
    actual.name == expected
  end     
  
  failure_message_for_should do |actual|
    "expected that #{actual} would be named #{expected}"
  end
  
  failure_message_for_should_not do |actual|
    "expected that #{actual} would not be named #{expected}"
  end

  description do
    "be named #{expected}"
  end  
end  

Spec::Matchers.define :be_type do |expected|
  match do |actual|
    actual.type.to_sym == expected.to_sym
  end     
end
