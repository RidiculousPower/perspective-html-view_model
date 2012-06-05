
module ::Magnets::HTML::ViewModel::Bindings
  
  include ::CascadingConfiguration::Setting
  
  ccm = ::CascadingConfiguration::Methods

  ##################
  #  __pathmap__   #
  #  __pathmap__=  #
  ##################

  attr_configuration :__pathmap__
  
  ccm.alias_module_and_instance_methods( self, :pathmap, :__pathmap__ )
  
end
