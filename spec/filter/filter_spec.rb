# FILTERS

it "empty filters" do                          
  let :filters = { MagicFilter.chain }

  it "can be configured with filter 'my_arg_filter' " do
    _filter = filters << :argument, 'my_arg_filter'
    _filter.should == Filter::Argument
    _filter.name.should == 'my_arg_filter'

    filters << :argument, :my_arg_filter do |filter|
      _filter.should == Tracing::Filter::Argument
      _filter.name.should == 'my_arg_filter'
    end
  end      

  # any class is a module, no reason for composite class AND module filters!
  # class_filter only makes sense regarding initialize 
  
  it "should add class filters" do    
    filters.class_filter :include, :Abc
    filters.class_filter 'my classes' do |cf|
      cf.rules do |rules|
        rules.name 'my class rules'
        rules.default :exclude
        cf << {:include, :Abc, :methods => [:ab, :bc], :initializer}        
        cf << {:include, :Abc, :methods => [:ab, :bc]}
        cf << {:exclude, :Abc, :methods => [:ab, :bc]}              
      end
    end      

    filters.class_filter('my classes').rules do |rules|
      rules.name 'my module rules'
      rules.default :yield
      rules << {:include => :Abc, :methods => [:ab, :bc]}
      rules << {:exclude => :Abc, :methods => [:ab, :bc]}              
    end      

  it "should add module filters" do    
    
    # use method_missing to find Filter::Module
    filters << module_filter 'my modules' do |mf|
      mf.defaults :yield, :exclude
      
      # add nested class filter
      mf.class_filter do |cf|
        cf.defaults :yield, :include        
        cf.name_filter do |nf|
          nf << :include => [:Abc, :Def]
        end
        cf.method_filter do |mf|
          mf << :include => [:ab, :bc]
          mf << :exclude => [:cf]
        end
      end  

      mf.class_filter :exclude => [Cdf], :include => [/Blip/] do |cf|
        cf.defaults :yield, :include        
        cf.name_filter do |nf|
          nf << :include => [Abc, Def]
        end
        cf.method_filter do |mf|
          mf << :include => [:ab, :bc] # implicit name filters!
          mf << :exclude => [:cf]
          cf.name_filter do |nf|       # explicit name filters!
            nf << :include => [Abc, Def]
          end          
        end
      end  
                         
      # add nested module filter
      mf.module_filter do |mf|
        mf << :include, :names => [:Abc, :Def], :methods => [:ab, :bc]}
        mf << :exclude, :methods => [:ab, :bc]} 
        mf.default :exclude        
        mf.module_filter do |mf|
          # method missing  
          # implicit exclude name filter, using method names as names! - requires names method
          mf.method_filter :exclude, :names => [:ab, :bc] # if first argument is string, use as name, otherwise pass args as options
          mf.default :include                  
        end          
      end  

      # Filter interface
      Filter
        def initialize(name, *args)
         

    end 

  end      

  it "should add method filters" do      
    filters.method_filter :include, /exec_/      
    filters.method_filter :exclude do |mf|
      mf << {:Abc, :methods => [:ab, :bc]}
      mf << {:Abc, :methods => [:ab, :bc]}              
    end      
  end   

  it "should add instance var filters" do        
    filters.inst_var_filter 'check template path', :template_path do |f|
      f.rules do |rules|
        rules.default :exclude
        rules << :include => /taglib/ 
        rules << :exclude => /rapid/         
      end
    end
  end  

  # include/exclude certain modules and from those matching also include/exclude certain methods
  it "should add module filters" do        
    filters.inst_var_filter 'my modules', {:var => :template_path, :default => :exclude} do |f|
      f.rules do |rules|    
        rules.name 'my_modules'
        rules.default :exclude
        rules << :include => /Hobo/, :methods => [:ab, :bc] 
        rules << /Dryml/ # use default :exclude        
      end
    end
  end  
       
end
